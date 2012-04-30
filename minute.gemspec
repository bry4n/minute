$:.unshift File.expand_path('../lib', __FILE__)

require "rubygems"

Gem::Specification.new do |gem|
  gem.name            = "minute"
  gem.version         = "0.2"
  gem.author          = "Bryan Goines"
  gem.summary         = "Natural Language Date/Time parsing library for Ruby"
  gem.email           = "bryann83@gmail.com"
  gem.homepage        = "https://github.com/bry4n/minute"
  gem.files           = Dir['README.md', 'LICENSE', 'lib/**/*.rb']
  gem.add_dependency "small", "0.3"
end
