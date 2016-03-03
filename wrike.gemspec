# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name    = %q{wrike3}
  s.version = '0.3.0'

  s.homepage = %q{http://github.com/morshedalam/wrike3}
  s.authors  = ['Morshed Alam']
  s.date     = %q{2016-02-20}
  s.email    = %q{morshed201@gmail.com}

  s.description = 'Wrike3 is a Ruby client for the Wrike API V3.'
  s.summary     = 'Wrike3 is a Ruby client for the Wrike API V3.'

  s.rubyforge_project = 'wrike3'
  s.extra_rdoc_files  = ['README.md', 'LICENSE']
  s.rdoc_options      = ['--inline-source', '--charset=UTF-8']

  s.files            = `git ls-files`.split("\n")
  s.test_files       = `git ls-files -- {test}/*`.split("\n")
  s.require_paths    = ['lib']
  s.rubygems_version = '1.9.3'

  s.add_runtime_dependency(%q<httparty>, ['~> 0.13.7'])
  s.add_runtime_dependency(%q<mime-types>, ['~> 2.99', '>= 2.99.1'])
  %w(shoulda mocha).each do |dep|
    s.add_development_dependency dep
  end
end