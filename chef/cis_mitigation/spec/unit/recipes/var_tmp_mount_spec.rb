require 'spec_helper'

describe 'cis_mitigation::var_tmp_mount' do
  describe 'mount /var/tmp' do
    it { is_expected.to mount_mount('/var/tmp').with(device: '/tmp') }
    it { is_expected.to mount_mount('/var/tmp').with(fstype: 'none') }
    it { is_expected.to mount_mount('/var/tmp').with(options: %w(rw nodev nosuid noexec bind)) }
  end
end
