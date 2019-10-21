name 'kitchen-ami-builder'

default_source :supermarket
default_source :chef_repo, '../..' do |s|
  s.preferred_for 'ami_builder'
end

cookbook 'cis_mitigation', path: '../../../../chef/cis_mitigation'

run_list 'ami_builder'
