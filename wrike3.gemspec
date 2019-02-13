# -*- encoding: utf-8 -*-
require File.expand_path('../lib/wrike3/version', __FILE__)

Gem::Specification.new do |s|
  s.name    = 'wrike3'
  s.version = Wrike3::VERSION

  s.homepage = 'http://github.com/morshedalam/wrike3'
  s.authors  = ['Morshed Alam']
  s.date     = '2016-02-20'
  s.email    = 'morshed201@gmail.com'

  s.description = 'Ruby client to access Wrike API V3.'
  s.summary     = 'Wrike API extension'

  s.license       = 'MIT'
  s.rubyforge_project = 'wrike3'
  s.extra_rdoc_files  = ['README.md', 'LICENSE']
  s.rdoc_options      = ['--inline-source', '--charset=UTF-8']

  s.files            = `git ls-files`.split("\n")
  s.test_files       = `git ls-files -- {test}/*`.split("\n")
  s.require_paths    = ['lib']
  s.rubygems_version = '1.9.3'

  s.add_runtime_dependency('httparty', '~> 0.14.0')
  s.add_runtime_dependency('mime-types')
  s.add_runtime_dependency('shoulda', '~> 3.5')
  s.add_runtime_dependency('mocha', '~> 1.1')
end