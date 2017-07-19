# The application that needs to use `Rack::AppVersion` middleware needs to:
#   1. include this gem in the Gemfile, and
#   2. add `Rack::AppVersion` middleware in the list of middlewares
#     the application is using
#
# The second step is easy to miss. This rspec matcher can be used
# by the application to ensure that everything is properly configured.
#
# Sample use:
#
#   ```ruby
#   it 'has app version in response headers' do
#     expect(env).to have_app_version
#   end
#   ```
require 'active_support/core_ext/object/blank'

RSpec::Matchers.define :have_app_version do
  match do
    key = Rack::AppVersion::HEADER_KEY
    actual.key?(key) && actual[key].is_a?(String) && actual[key].present?
  end
end
