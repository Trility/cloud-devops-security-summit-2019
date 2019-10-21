# CIS 1.1.6 Ensure separate partition exists for /var/tmp
# CIS 1.1.7 Ensure nodev option set on /var/tmp partition
# CIS 1.1.8 Ensure nosuid option set on /var/tmp partition
# CIS 1.1.9 Ensure noexec option set on /var/tmp partition

mount '/var/tmp' do
  device '/tmp'
  fstype 'none'
  options 'rw,nodev,nosuid,noexec,bind'
  action [:mount, :enable]
end
