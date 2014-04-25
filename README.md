# Capybara Screenshot Idobata

[![Build Status](https://travis-ci.org/idobata/capybara_screenshot_idobata.png)](https://travis-ci.org/idobata/capybara_screenshot_idobata)

Save screenshot using [Capybara](https://github.com/jnicklas/capybara) and post to [Idobata](https://idobata.io).

For all users who met the failing tests only CI.

## Usage

You can use `save_screenshot_and_post_to_idobata` in your feature spec:

``` ruby
save_screenshot_and_post_to_idobata
```

## Installation

Add this line to your application's Gemfile:

``` ruby
gem 'capybara_screenshot_idobata', group: :test
```

And then execute:

``` sh
$ bundle
```

Or install it yourself as:

``` sh
$ gem install capybara_screenshot_idobata
```

## Using with Cucumber

First, you need to setup Capybara: https://github.com/jnicklas/capybara#using-capybara-with-cucumber

Load the `capybara_screenshot_idobata/cucumber` module in your `features/support/env.rb` and configure your `hook_url`:

``` ruby
require 'capybara_screenshot_idobata/cucumber'

CapybaraScreenshotIdobata.configure do |config|
  config.hook_url = '<PUT YOUR GENERIC HOOK URL HERE>'
end
```

## Using with RSpec

First, you need to setup Capybara: https://github.com/jnicklas/capybara#using-capybara-with-rspec

Load the `capybara_screenshot_idobata/rspec` module in your `spec/spec_helper.rb` and configure your `hook_url`:

``` ruby
require 'capybara_screenshot_idobata/rspec'

CapybaraScreenshotIdobata.configure do |config|
  config.hook_url = '<PUT YOUR GENERIC HOOK URL HERE>'
end
```

## Configuration

You can configure the following options:

* `hook_url` (**required**)
* `message_format` (optional) - default: `:html`
  * `:html` or `:text`
* `message_formatter` (optional)
  * You can customize message format.

Example:

``` ruby
CapybaraScreenshotIdobata.configure do |config|
  config.hook_url          = '<PUT YOUR GENERIC HOOK URL HERE>'
  config.message_format    = :text
  config.message_formatter = proc {|filepath, line, context|
    "hi: #{filepath}"
  }
end
```

## Test

``` sh
$ bundle exec rake
```

## Contributing

1. Fork it ( https://github.com/idobata/capybara_screenshot_idobata/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
