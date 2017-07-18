RSpec.describe 'have_app_version matcher' do
  context "env has 'X-App-Version' key" do
    it "passes when env['X-App-Version'] is not nil" do
      env = { 'X-App-Version' => '1a42433' }
      expect(env).to have_app_version
    end

    it "fails when env['X-App-Version'] is blank" do
      env = { 'X-App-Version' => '' }
      expect(env).to_not have_app_version
      env = { 'X-App-Version' => nil }
      expect(env).to_not have_app_version
    end
  end

  context "env has no 'X-App-Version' key" do
    it 'fails' do
      env = {}
      expect(env).to_not have_app_version
    end
  end
end
