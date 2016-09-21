# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jekyll_frontadder/version'

Gem::Specification.new do |s|
  s.name        = 'jekyll-frontadder'
  s.version     = JekyllFrontAdder::VERSION
  s.date        = '2016-09-20'
  s.summary     = 'Jekyll generator for frontmatter sums'
  s.description = 'Jekyll generator to sum frontmatter elements'
  s.homepage    = 'https://github.com/nitehawk/jekyll-frontadder'
  s.license     = 'MIT'

  s.authors     = ['Nitehawk']
  s.email       = ['nite97m@gmail.com']

  all_files     = `git ls-files -z`.split("\x0")
  s.files       = all_files.grep(%r{^(bin|lib|data)/})
  s.executables = all_files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.require_paths = ['lib']

  s.add_development_dependency('rubocop')

  s.add_runtime_dependency('jekyll', '>= 3.1.6')
end
