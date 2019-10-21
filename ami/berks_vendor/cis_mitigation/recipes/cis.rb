# CIS 1.6.1 Configure SELinux
cookbook_file '/etc/selinux/config' do
  source 'selinux_config'
end

# CIS 4.3 Ensure logrotate is configured
template '/etc/logrotate.d/syslog' do
  source 'syslog.erb'
end

# CIS SSH Server Configuration
# CIS 5.2.4 Ensure SSH X11 forwarding is disabled
# CIS 5.2.13 Ensure SSH LoginGraceTime is set to one minute or less
execute 'ensure_x11_forwarding_disabled' do
  command "sed -i '{
  s/X11Forwarding yes/X11Forwarding no/g

  }' /etc/ssh/sshd_config"
  not_if File.readlines('/etc/ssh/sshd_config').grep(/^X11Forwarding no/)
end
