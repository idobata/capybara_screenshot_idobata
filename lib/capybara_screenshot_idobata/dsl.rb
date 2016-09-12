require 'pathname'
require 'rest_client'

module CapybaraScreenshotIdobata
  module DSL
    def save_screenshot_and_post_to_idobata(filename = "screenshot-#{Time.now.to_i}.png", options = {})
      raise 'missing config `CapybaraScreenshotIdobata.hook_url`' unless CapybaraScreenshotIdobata.hook_url

      options = detect_default_option(Capybara.current_driver).merge(options)

      screenshot_path = save_screenshot(filename, options)

      absolute_filepath, line = caller[0].split(':')

      filepath = Pathname(absolute_filepath).relative_path_from(Pathname(Dir.pwd))

      source = CapybaraScreenshotIdobata.message_formatter.call(filepath, line, self)

      File.open(screenshot_path, 'rb') do |file|
        RestClient.post(CapybaraScreenshotIdobata.hook_url,
          {
            source: source,
            format: CapybaraScreenshotIdobata.message_format,
            image:  file
          },
          {
            'User-Agent' => "CapybaraScreenshotIdobata/v#{CapybaraScreenshotIdobata::VERSION}"
          }
        )
      end
    end

    def detect_default_option(driver)
      case driver
      when :poltergeist
        {full: true}
      else
        {}
      end
    end
  end
end
