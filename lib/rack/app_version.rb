require 'rack/app_version/version'

module Rack
  # AppVersion
  class AppVersion
    HEADER_KEY = 'X-App-Version'.freeze
    APP_VERSION_PATH = '.app_version'.freeze

    def initialize(app)
      @app = app
      @app_version = IO.readlines(APP_VERSION_PATH)[0].chomp
    end

    def call(env)
      dup._call env
    end

    def _call(env)
      @app.call(env).tap \
        { |_s, headers, _b| headers[HEADER_KEY] = @app_version }
    end
  end
end
