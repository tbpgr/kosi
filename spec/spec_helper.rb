# encoding: utf-8
require 'simplecov'
require 'coveralls'
Coveralls.wear!
SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
])
SimpleCov.start do
  add_filter '/spec/'
end
RSpec.configure do |config|
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
end
