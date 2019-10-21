include_recipe 'cis_mitigation'
include_recipe 'ami_builder::awscli'

# Call at the end to allow Chef to do it's work in /tmp without issues.
content_script = <<-EOH
mount -o remount,noexec /tmp
EOH

file '/etc/rc.local' do
  content content_script
  owner 'root'
  group 'root'
  mode '0731'
  action :create
end

include_recipe 'cis_mitigation::tmp_mount'
