require 'spec_helper'

describe 'cis_mitigation::cis' do
  before do
    stub_command([]).and_return(false)
  end

  it 'configure selinux' do
    expect(chef_run).to create_cookbook_file('/etc/selinux/config')
  end

  it 'configure logrotate' do
    expect(chef_run).to create_template('/etc/logrotate.d/syslog')
  end

  it 'disable x11 forwarding' do
    expect(chef_run).to run_execute('ensure_x11_forwarding_disabled')
  end
end
