require 'spec_helper'

describe 'cis_mitigation::tmp_mount' do
  it 'mount /var/tmp' do
    is_expected.to mount_mount('/var/tmp').with(device: '/tmp')
    is_expected.to mount_mount('/var/tmp').with(fstype: 'none')
    is_expected.to mount_mount('/var/tmp').with(options: %w(rw nodev nosuid noexec bind))
  end
end
