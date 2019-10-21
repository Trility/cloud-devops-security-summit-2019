describe file('/var/tmp') do
  it { should exist }
  it { should be_mounted }
end
