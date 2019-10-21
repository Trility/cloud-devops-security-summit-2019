describe file('/tmp/testfile.sh') do
  it { should exist }
  its('mode') { should cmp '0755' }
end
