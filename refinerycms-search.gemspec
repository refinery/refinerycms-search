Gem::Specification.new do |s|
  s.name              = %q{refinerycms-search}
  s.version           = %q{1.0.0}
  s.date              = %q{2010-10-01}
  s.summary           = %q{Extra search handling for Refinery CMS}
  s.description       = %q{Provides extra functionality for searching your frontend website using Refinery CMS.}
  s.homepage          = %q{http://refinerycms.com}
  s.email             = %q{info@refinerycms.com}
  s.authors           = ["Resolve Digital"]
  s.require_paths     = %w(lib)

  s.add_dependency    'refinerycms', '>= 1.0.0'

  s.files             = [
    'app',
    'app/controllers',
    'app/controllers/search_controller.rb',
    'app/helpers',
    'app/helpers/search_helper.rb',
    'app/models',
    'app/models/search_engine.rb',
    'app/views',
    'app/views/search',
    'app/views/search/show.html.erb',
    'app/views/shared',
    'app/views/shared/_search.html.erb',
    'config',
    'config/locales',
    'config/locales/en.yml',
    'config/routes.rb',
    'lib',
    'lib/gemspec.rb',
    'lib/refinerycms-search.rb',
    'readme.md',
    'refinerycms-search.gemspec'
  ]
  s.require_path = 'lib'
end
