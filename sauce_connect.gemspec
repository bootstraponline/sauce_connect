require_relative 'lib/sauce_connect/version'

Gem::Specification.new do |spec|
  spec.name          = 'sauce_connect'
  spec.version       = SauceConnect::VERSION
  spec.date          = SauceConnect::DATE
  spec.license       = 'http://www.apache.org/licenses/LICENSE-2.0.txt'
  spec.description   = spec.summary = 'Sauce Connect'
  spec.description   += '.' # avoid identical warning
  spec.authors       = spec.email = ['code@bootstraponline.com']
  spec.homepage      = 'https://github.com/bootstraponline/sauce_connect'
  spec.require_paths = ['lib']

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.add_runtime_dependency 'hurley', '~> 0.2'
  spec.add_runtime_dependency 'rubyzip', '~> 1.1', '>= 1.1.7'
  spec.add_runtime_dependency 'multi_json', '~> 1.11', '>= 1.11.2'

  spec.add_development_dependency 'rspec', '~> 3.4'
  spec.add_development_dependency 'appium_thor', '~> 1.0.1'
end
