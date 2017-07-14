require 'simplecov'
SimpleCov.start

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'rack/app_version'
require 'rack/app_version/have_app_version_matcher'
require 'byebug'
