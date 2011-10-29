#!/usr/bin/env ruby
version = '2.0.0'
raise "Could not get version so gemspec can not be built" if version.nil?
files = Dir.glob("**/*").flatten.reject do |file|
  file =~ /\.gem$/
end

gemspec = <<EOF
Gem::Specification.new do |s|
  s.name              = %q{refinerycms-search}
  s.version           = %q{#{version}}
  s.date              = %q{#{Time.now.strftime('%Y-%m-%d')}}
  s.summary           = %q{Extra search handling for Refinery CMS}
  s.description       = %q{Provides extra functionality for searching your frontend website using Refinery CMS.}
  s.homepage          = %q{http://refinerycms.com}
  s.email             = %q{info@refinerycms.com}
  s.authors           = ["Resolve Digital"]
  s.require_paths     = %w(lib)

  s.add_dependency    'refinerycms-core', '~> 2.0.0'

  s.files             = [
    '#{files.join("',\n    '")}'
  ]
  s.require_path = 'lib'
end
EOF

File.open(File.expand_path("../../refinerycms-search.gemspec", __FILE__), 'w').puts(gemspec)