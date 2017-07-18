# Rack::AppVersion Middleware
[![Build Status](https://semaphoreci.com/api/v1/wnuqui/rack-app_version/branches/master/badge.svg)](https://semaphoreci.com/wnuqui/rack-app_version) [![Ebert](https://ebertapp.io/github/wnuqui/rack-app_version.svg)](https://ebertapp.io/github/wnuqui/rack-app_version) <a href="https://codeclimate.com/github/wnuqui/rack-app_version"><img src="https://codeclimate.com/github/wnuqui/rack-app_version/badges/gpa.svg" /></a> <a href="https://codeclimate.com/github/wnuqui/rack-app_version"><img src="https://codeclimate.com/github/wnuqui/rack-app_version/badges/issue_count.svg" /></a> <a href="https://codeclimate.com/github/wnuqui/rack-app_version/coverage"><img src="https://codeclimate.com/github/wnuqui/rack-app_version/badges/coverage.svg" /></a>

`Rack::AppVersion` is a middleware that sets the version of an app (Rack compatible web applications) via response header.

## Setup

### 1. In your Gemfile

```ruby
gem 'rack-app_version', git: 'git://github.com/wnuqui/rack-app_version.git', branch: 'master'
```

### 2. In `config/application.rb` of your Rails application, put the code below.

```ruby
module YourApp
  class Application < Rails::Application

    # ...

    config.middleware.use Rack::AppVersion

  end
end
```

### 3. In `Rakefile` of your Rails application, put the code below.

```ruby
module Rack
  class AppVersion
    def self.generate_version
      # Implement logic of getting application version here.
    end
  end
end

require 'rack/app_version/rake/task'
Rack::AppVersion.load_tasks
```

Doing `bundle exec rake -T | grep app_version` will give you the following which you can use:

```bash
rake app_version:generate               # generate app version and write it in .app_version file
rake app_version:init                   # generate .app_version file that will contain application version
```

See The [Rails Guide to Rack](http://guides.rubyonrails.org/rails_on_rack.html) for more details on rack middlewares or watch the [railscast](http://railscasts.com/episodes/151-rack-middleware).

## Common Gotchas

To determine where to put the `Rack::AppVersion` middleware in the Rack stack, run the following command:

```bash
bundle exec rake middleware
```

In many cases, the Rack stack will be different running in production environment. Run the following command to see the middleware stack in production:

```bash
RAILS_ENV=production bundle exec rake middleware
```
