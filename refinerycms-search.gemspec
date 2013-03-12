# Encoding: UTF-8

Gem::Specification.new do |s|
  s.name              = %q{refinerycms-search}
  s.version           = %q{2.1.0.dev}
  s.summary           = %q{Extra search handling for Refinery CMS}
  s.description       = %q{Provides extra functionality for searching your frontend website using Refinery CMS.}
  s.homepage          = %q{http://refinerycms.com}
  s.email             = %q{info@refinerycms.com}
  s.authors           = ["Philip Arndt", "Uģis Ozols", "Joe Sak"]
  s.require_paths     = %w(lib)

  s.files             = `git ls-files`.split("\n")
  s.test_files        = `git ls-files -- spec/*`.split("\n")

  s.add_dependency    'refinerycms-core', '~> 2.1.0.dev'
end
