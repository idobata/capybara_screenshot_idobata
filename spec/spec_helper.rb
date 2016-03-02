require 'capybara/rspec'
require 'capybara_screenshot_idobata/rspec'

require 'webmock/rspec'

Dir[File.dirname(__FILE__) + '/support/**/*.rb'].each { |f| require f }

RSpec.configure do |config|
  config.run_all_when_everything_filtered = true
  config.filter_run :focus

  config.include MultipartHelper, type: :feature
end

CapybaraScreenshotIdobata.configure do |config|
  config.hook_url = 'http://idobata.io/hook/TOKEN'
end

Capybara.app = lambda {|env| [200, {}, ['hi']] }
