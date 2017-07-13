require 'active_support/core_ext/object/blank'

RSpec::Matchers.define :have_app_version do
  match do
    key = Rack::AppVersion::HEADER_KEY
    actual.has_key?(key) && actual[key].is_a?(String) && actual[key].present?
  end
end
