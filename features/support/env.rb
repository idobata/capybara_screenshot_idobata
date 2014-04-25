require 'capybara/cucumber'
require 'rspec'
require 'cucumber/rspec/doubles'
require 'webmock/cucumber'

require_relative '../../spec/support/multipart_helper'
require 'capybara_screenshot_idobata/cucumber'

CapybaraScreenshotIdobata.configure do |config|
  config.hook_url = 'http://idobata.io/hook/TOKEN'
end

Capybara.app = lambda {|env| [200, {}, ['hi']] }

Before do
  allow(page.driver).to receive(:save_screenshot).and_return {|filepath|
    File.write(filepath, "\x89PNG")
  }
end

After do
  Dir['screenshot-*.png'].each do |path|
    File.unlink path
  end
end

World MultipartHelper
