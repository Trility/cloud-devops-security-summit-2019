include_recipe 'cis_mitigation'
include_recipe 'ami_builder::awscli'

# Call at the end to allow Chef to do it's work in /tmp without issues.
include_recipe 'cis_mitigation::tmp_mount'
