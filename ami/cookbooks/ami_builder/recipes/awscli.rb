# Python setuptools
package 'python-setuptools'
package 'unzip'

# Amazon CLI Bundle
remote_file "#{Chef::Config[:file_cache_path]}/awscli-bundle.zip" do
  source 'https://s3.amazonaws.com/aws-cli/awscli-bundle.zip'
  notifies :run, 'execute[unzip_awscli_bundle]', :immediately
end

execute 'unzip_awscli_bundle' do
  command "unzip -o #{Chef::Config[:file_cache_path]}/awscli-bundle.zip -d #{Chef::Config[:file_cache_path]}"
  action :nothing
  notifies :run, 'execute[install_awscli_bundle]', :immediately
end

execute 'install_awscli_bundle' do
  command "python #{Chef::Config[:file_cache_path]}/awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws"
  action :nothing
end

file '/usr/local/aws/bin/aws' do
  mode '0755'
end

bash 'group-read-aws' do
  code <<-EOH
  chmod o+rx /usr/local/aws
  chmod -R o+r /usr/local/aws
  chmod o+rx $(find /usr/local/aws -type d)
  EOH
end
