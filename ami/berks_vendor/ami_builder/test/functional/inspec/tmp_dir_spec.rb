# CIS 1.1.9 Ensure noexec option set on /var/tmp partition
describe command('/var/tmp/testfile.sh') do
  its('exit_status') { should eq 126 }
end
