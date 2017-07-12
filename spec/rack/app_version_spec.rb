require 'spec_helper'

describe Rack::AppVersion do
  let(:app) { ->(env) { [200, env, 'app'] } }

  let :middleware do
    Rack::AppVersion.new app
  end

  it 'generates the version of the app' do
    _, env = middleware.call({})
    expect(env).to have_app_version
  end
end
