require 'spec_helper'

describe 'cis_mitigation::tmp_mount' do
  before(:each) do
    allow_any_instance_of(Chef::Recipe).to receive(:include_recipe).and_call_original
    allow_any_instance_of(Chef::Recipe).to receive(:include_recipe).with('cis_mitigation::var_tmp_mount')
  end

  it 'make images directory' do
    is_expected.to create_directory('/root/images').with(
      owner: 'root',
      group: 'root'
    )
  end

  it 'create tmpfile' do
    expect(chef_run).to run_execute('dd if=/dev/zero of=/root/images/tmpfile.bin bs=1 count=0 seek=2G')
  end

  it 'make tmpfile ext4' do
    expect(chef_run).to run_execute('mkfs.ext4 /root/images/tmpfile.bin')
  end

  describe 'mount /tmp' do
    it { is_expected.to mount_mount('/tmp').with(device: '/root/images/tmpfile.bin') }
    it { is_expected.to mount_mount('/tmp').with(fstype: 'ext4') }
    it { is_expected.to mount_mount('/tmp').with(options: %w(loop rw nodev nosuid noexec)) }
  end

  it 'chmod /tmp' do
    expect(chef_run).to run_execute('chmod 1777 /tmp')
  end

  it 'call cis_mitigation::var_tmp_mount' do
    expect_any_instance_of(Chef::Recipe).to receive(:include_recipe).with('cis_mitigation::var_tmp_mount')
    chef_run
  end
end
