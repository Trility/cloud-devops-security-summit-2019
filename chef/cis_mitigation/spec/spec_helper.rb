require 'chefspec'
require 'chefspec/berkshelf'

ChefSpec::Coverage.start!

RSpec.configure do |c|
  c.platform = 'ubuntu'
  c.version = '18.04'
  c.log_level = :fatal
  c.color = true
  c.formatter = 'documentation'
end
