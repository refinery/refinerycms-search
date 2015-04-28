module Refinery
  class SearchGenerator < Rails::Generators::Base

    source_root File.expand_path("../templates", __FILE__)

    def generate_search_initializer
      template "config/initializers/refinery/search.rb.erb", File.join(destination_root, "config", "initializers", "refinery", "search.rb")
    end

    def rake_db
      rake("refinery_search:install:migrations")
    end

    def append_load_seed_data
      create_file 'db/seeds.rb' unless File.exists?(File.join(destination_root, 'db', 'seeds.rb'))
      append_file 'db/seeds.rb', verbose: true do
        <<-EOH

# Added by Refinery CMS Search engine
Refinery::Search::Engine.load_seed
        EOH
      end
    end

  end
end
