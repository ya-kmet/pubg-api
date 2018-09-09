lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pubg/api/version'

Gem::Specification.new do |spec|
  spec.name          = 'pubg-api'
  spec.version       = Pubg::Api::VERSION
  spec.authors       = ['Bartłomiej Danek']
  spec.email         = ['bartek.danek@gmail.com']

  spec.summary       = 'PUBG API wrapper for Ruby'
  spec.description   = 'Unofficial PUBG API wrapper for Playerunknown\'s Battlegrounds (early-access stage)'
  spec.homepage      = 'https://github.com/bartlomiejdanek/pubg-api'
  spec.license       = 'MIT'

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 2.3'

  spec.add_dependency 'httparty', '>= 0.15'
  spec.add_dependency 'plissken', '>= 1.0.0'
  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop', '~> 0.53'
end
