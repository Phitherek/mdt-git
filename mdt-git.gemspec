require_relative './lib/mdt/version'

Gem::Specification.new do |s|
  s.name = 'mdt-git'
  s.version = MDT::Git::VERSION
  s.date = '2018-03-16'
  s.summary = 'MDT Git module'
  s.description = 'Git module for MDT'
  s.authors = ['Phitherek_']
  s.email = ['phitherek@gmail.com']
  s.files = Dir['lib/**/*.rb'] + Dir['bin/*']
  s.homepage = 'https://github.com/Phitherek/mdt-git'
  s.license = 'MIT'
  s.extra_rdoc_files = ['README.md']
  s.rdoc_options << '--title' << 'MDT Git module' << '--main' << 'README.md' << '--line-numbers'
  s.metadata = {
      'documentation_uri' => 'http://www.rubydoc.info/github/Phitherek/mdt-git',
      'source_code_uri' => 'https://github.com/Phitherek/mdt-git'
  }
  s.add_runtime_dependency 'mdt-core', '~> 0.0'
  s.add_development_dependency 'rspec', '~> 3.7'
end
