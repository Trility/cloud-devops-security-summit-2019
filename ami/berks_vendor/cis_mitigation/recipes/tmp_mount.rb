# CIS 1.1.2 Ensure separate partition exists for /tmp
# CIS 1.1.3 Ensure nodev option set on /tmp partition
# CIS 1.1.4 Ensure nosuid option set on /tmp partition

directory '/root/images' do
  owner 'root'
  group 'root'
  action :create
end

execute 'dd if=/dev/zero of=/root/images/tmpfile.bin bs=1 count=0 seek=2G'

execute 'mkfs.ext4 /root/images/tmpfile.bin'

mount '/tmp' do
  device '/root/images/tmpfile.bin'
  fstype 'ext4'
  options 'loop,rw,nodev,nosuid,noexec'
  action [:mount, :enable]
end

execute 'chmod 1777 /tmp'

include_recipe 'cis_mitigation::var_tmp_mount'
