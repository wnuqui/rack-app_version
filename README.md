# Rack::AppVersion Middleware [![Build Status](https://semaphoreci.com/api/v1/wnuqui/rack-app_version/branches/master/badge.svg)](https://semaphoreci.com/wnuqui/rack-app_version)

`Rack::AppVersion` is a middleware that sets the version of an app (Rack compatible web applications) via response header.

## Installation

In your Gemfile:

```ruby
gem 'rack-app_version', git: 'git://github.com/wnuqui/rack-app_version.git', branch: 'master'
```

## Configuration

### Rails

In `config/application.rb` of your Rails application, put the code below.

```ruby
module YourApp
  class Application < Rails::Application

    # ...

    config.middleware.use Rack::AppVersion

  end
end
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
