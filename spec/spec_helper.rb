require '../lib/honkr'
require 'pry-debugger'

RSpec.configure do |config|
  config.before(:each) do
    Honkr.instance_variable_set(:@__db_instance, nil)
  end
end
