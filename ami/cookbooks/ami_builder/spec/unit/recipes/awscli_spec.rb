require 'spec_helper'

describe 'ami_builder::awscli' do
  let(:chef_run) { ChefSpec::SoloRunner.converge(described_recipe) }

  it 'install python setuptools pacakge' do
    expect(chef_run).to install_package('python-setuptools')
  end

  it 'install unzip pacakge' do
    expect(chef_run).to install_package('unzip')
  end

  before do
    allow(File).to receive(:exist?).and_call_original
    allow(File).to receive(:exist?).with("#{Chef::Config[:file_cache_path]}/awscli-bundle.zip")
  end

  it 'download awscli bundle' do
    expect(chef_run).to create_remote_file("#{Chef::Config[:file_cache_path]}/awscli-bundle.zip")
  end

  it 'extract awscli bundle' do
    item = chef_run.execute('unzip_awscli_bundle')
    expect(item.command).to match("unzip -o #{Chef::Config[:file_cache_path]}/awscli-bundle.zip -d #{Chef::Config[:file_cache_path]}")
    expect(item).to do_nothing
    expect(chef_run.remote_file("#{Chef::Config[:file_cache_path]}/awscli-bundle.zip")).to notify('execute[unzip_awscli_bundle]').to(:run).immediately
  end

  it 'install awscli bundle' do
    item = chef_run.execute('install_awscli_bundle')
    expect(item.command).to match("python #{Chef::Config[:file_cache_path]}/awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws")
    expect(item).to do_nothing
    expect(chef_run.execute('unzip_awscli_bundle')).to notify('execute[install_awscli_bundle]').to(:run).immediately
  end

  it 'aws cli is executable' do
    expect(chef_run).to create_file('/usr/local/aws/bin/aws').with(mode: '0755')
  end

  it 'group read for aws cli' do
    expect(chef_run).to run_bash('group-read-aws')
  end
end
