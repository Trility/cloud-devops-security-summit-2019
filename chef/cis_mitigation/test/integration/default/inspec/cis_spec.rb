# CIS 1.6.1 Configure SELinux
describe file('/etc/selinux/config') do
  it { should exist }
end

# CIS 4.3 Ensure logrotate is configured
describe file('/etc/logrotate.d/syslog') do
  its('content') { should match %r{^\/var\/log\/cron} }
  its('content') { should match %r{^\/var\/log\/maillog} }
  its('content') { should match %r{^\/var\/log\/messages} }
  its('content') { should match %r{^\/var\/log\/secure} }
  its('content') { should match %r{^\/var\/log\/spooler} }
  its('content') { should match %r{^\/var\/log\/boot.log} }
end

# CIS SSH Server Configuration
# CIS 5.2.4 Ensure SSH X11 forwarding is disabled
# CIS 5.2.13 Ensure SSH LoginGraceTime is set to one minute or less
describe file('/etc/ssh/sshd_config') do
  its('content') { should match /^X11Forwarding no/ }
end
