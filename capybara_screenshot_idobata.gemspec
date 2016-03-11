lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift lib unless $LOAD_PATH.include?(lib)

require 'capybara_screenshot_idobata/version'

Gem::Specification.new do |spec|
  spec.name          = 'capybara_screenshot_idobata'
  spec.version       = CapybaraScreenshotIdobata::VERSION
  spec.authors       = ['Ryunosuke SATO']
  spec.email         = ['tricknotes@idobata.io']
  spec.summary       = %q{Post screenshot to Idobata}
  spec.description   = %q{Post screenshot to Idobata}
  spec.homepage      = 'https://github.com/idobata/capybara_screenshot_idobata'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'capybara', '~> 2.0'
  spec.add_dependency 'rest-client'

  spec.add_development_dependency 'bundler',  '~> 1.5'
  spec.add_development_dependency 'cucumber', '~> 1.3.0'
  spec.add_development_dependency 'multipart-parser'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec',    '~> 3.0'
  spec.add_development_dependency 'webmock'
end
