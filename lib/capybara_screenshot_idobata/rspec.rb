require 'erb'

require 'capybara_screenshot_idobata'
require 'capybara_screenshot_idobata/dsl'

RSpec.configure do |config|
  config.include CapybaraScreenshotIdobata::DSL, type: :feature
end

CapybaraScreenshotIdobata.configure do |config|
  config.message_formatter = proc {|file, line, context|
<<-MESSAGE
Screenshot from: <code>#{ERB::Util.h(file)}:#{line}</code>
<br>
<b>#{ERB::Util.h(RSpec.current_example.full_description)}</b>
MESSAGE
  }
end
