require 'spec_helper'

describe 'ami_builder::default' do
  let(:chef_run) { ChefSpec::SoloRunner.converge(described_recipe) }

  before(:each) do
    allow_any_instance_of(Chef::Recipe).to receive(:include_recipe).and_call_original
    allow_any_instance_of(Chef::Recipe).to receive(:include_recipe).with('cis_mitigation')
    allow_any_instance_of(Chef::Recipe).to receive(:include_recipe).with('cis_mitigation::tmp_mount')
    allow_any_instance_of(Chef::Recipe).to receive(:include_recipe).with('ami_builder::awscli')
  end

  it 'call cis_mitigation' do
    expect_any_instance_of(Chef::Recipe).to receive(:include_recipe).with('cis_mitigation')
    chef_run
  end

  it 'call awscli' do
    expect_any_instance_of(Chef::Recipe).to receive(:include_recipe).with('ami_builder::awscli')
    chef_run
  end

  it 'create rc.local' do
    expect(chef_run).to create_file('/etc/rc.local').with(mode: '0731')
  end

  it 'call cis_mitigation::tmp_mount' do
    expect_any_instance_of(Chef::Recipe).to receive(:include_recipe).with('cis_mitigation::tmp_mount')
    chef_run
  end
end
