execute 'apt_update' do
  command 'apt update'
  only_if { File.exist?('/tmp/kitchen') }
end

include_recipe 'cis_mitigation::cis'
