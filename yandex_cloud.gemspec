lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'yandex_cloud/version'

Gem::Specification.new do |spec|
  spec.name = 'yandex_cloud'
  spec.version = YandexCloud::VERSION
  spec.authors = ['Anton Bogdanov']
  spec.email = ['kortirso@gmail.com']

  spec.summary = 'API wrapper for Yandex Cloud services'
  spec.description = 'API wrapper for Yandex Cloud services, such as Yandex.Translate'
  spec.homepage = 'https://github.com/kortirso/yandex-cloud'
  spec.license = 'MIT'

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.15'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rubocop', '~> 0.63.1'
  spec.add_dependency 'httparty', '~> 0.16'
end
