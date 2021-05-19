$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), "..", "lib"))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require "rspec"
require "rspec/its"
require "charwidth"
require "byebug"

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir["#{__dir__}/support/**/*.rb"].sort.each {|f| require f }

RSpec.configure do |config|
  # noop
end
