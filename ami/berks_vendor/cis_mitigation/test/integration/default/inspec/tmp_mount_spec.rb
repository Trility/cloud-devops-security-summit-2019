describe file('/root/images/tmpfile.bin') do
  it { should exist }
end

describe file('/tmp') do
  it { should exist }
  it { should be_mounted }
end
