require 'rack/app_version/version'

module Rack
  # AppVersion
  class AppVersion
    HEADER_KEY = 'X-App-Version'.freeze

    def initialize(app)
      @app = app
    end

    def call(env)
      dup._call env
    end

    def _call(env)
      @app.call(env).tap { |_s, headers, _b| headers[HEADER_KEY] = app_version }
    end

    def app_version
      `git log -n 1 --pretty='%h'`.chomp
    end
  end
end
