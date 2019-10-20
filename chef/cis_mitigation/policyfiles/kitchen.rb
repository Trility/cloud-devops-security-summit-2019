name 'kitchen'

default_source :supermarket
default_source :chef_repo, '../..' do |s|
  s.preferred_for 'cis_mitigation'
end

run_list 'cis_mitigation'
