RSpec::Matchers.define :have_app_version do
  match { actual[Rack::AppVersion::HEADER_KEY].is_a?(String) }
end
