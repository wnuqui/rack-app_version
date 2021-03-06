RSpec.describe Rack::AppVersion do
  let(:app) { ->(env) { [200, env, 'app'] } }

  let(:middleware) do
    Rack::AppVersion.new app
  end

  before(:all) do
    FileUtils.remove_entry(Rack::AppVersion::APP_VERSION_PATH, true)

    open(Rack::AppVersion::APP_VERSION_PATH, 'w') do |f|
      f << "d8b368e.\n"
    end
  end

  it 'generates the version of the app' do
    _, env = middleware.call({})
    expect(env).to have_app_version
  end

  it 'reads from app_version_path only once' do
    expect(IO).to receive(:readlines).once.and_call_original
    middleware.call({})
    middleware.call({})
  end

  after(:all) do
    FileUtils.remove_entry(Rack::AppVersion::APP_VERSION_PATH, true)
  end
end
