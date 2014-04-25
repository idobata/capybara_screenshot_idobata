module CapybaraScreenshotIdobata
  autoload :DSL,     'capybara_screenshot_idobata/dsl'
  autoload :VERSION, 'capybara_screenshot_idobata/version'

  class << self
    attr_accessor :hook_url, :message_format, :message_formatter

    def configure
      yield self
    end
  end

  configure do |config|
    config.message_format    = :html
    config.message_formatter = proc {|filepath, line, _context|
      "Screenshot from: <code>#{filepath}:#{line}</code>"
    }
  end
end

