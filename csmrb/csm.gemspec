Gem::Specification.new do |spec|
  spec.name                   = 'csm'
  spec.version                = '0.1.2'
  spec.authors                = ['Endormi']
  spec.required_ruby_version  = '>= 2.7'
  spec.summary                = 'Color scheme manager gem for your projects'
  spec.description            = 'The csm gem (color scheme manager) for your projects enabling customization and management of color schemes.'
  spec.homepage               = 'https://github.com/endormi/csm'
  spec.license                = 'MIT'

  spec.files                  = Dir.glob('lib/**/*.rb') + ['README.md', 'CHANGELOG.md']
  spec.add_runtime_dependency 'yaml'

  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rubocop'
end
