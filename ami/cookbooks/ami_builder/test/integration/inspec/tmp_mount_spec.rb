describe file('/tmp') do
  it { should exist }
  it { should be_mounted }
end
