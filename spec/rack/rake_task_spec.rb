require 'rack/app_version/rake/task'

module Rack
  class AppVersion
    def self.generate_version
      '10000'
    end
  end
end

RSpec.describe 'rake tasks' do
  context 'tasks loaded' do
    before(:all) { Rack::AppVersion.load_tasks }

    def silence_output(&block)
      expect(&block).to output(anything).to_stdout
    end

    it 'rakes app_version:init' do
      expect(FileUtils).to receive(:touch).with('.app_version').once
      silence_output { Rake::Task['app_version:init'].invoke }
    end

    it 'rakes app_version:generate' do
      silence_output { Rake::Task['app_version:init'].invoke }

      expect(IO)
        .to receive(:write)
        .with(Rack::AppVersion::APP_VERSION_PATH, '10000').once

      silence_output { Rake::Task['app_version:generate'].invoke }
    end
  end

  context 'tasks not loaded' do
    before(:all) { Rake::Task.clear }

    it 'raises error on "rake app_version:init"' do
      expect {
        Rake::Task['app_version:init'].invoke
      }.to raise_error(RuntimeError, "Don't know how to build task 'app_version:init' (see --tasks)")
    end

    it 'raises error on "rake app_version:generate"' do
      expect {
        Rake::Task['app_version:generate'].invoke
      }.to raise_error(RuntimeError, "Don't know how to build task 'app_version:generate' (see --tasks)")
    end
  end
end
