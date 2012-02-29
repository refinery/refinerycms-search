module Refinery
  module Search
    class Engine < Rails::Engine
      include Refinery::Engine

      initializer "register refinery_search plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = 'refinery_search'
          plugin.version = 2.0
          plugin.hide_from_menu = true
        end
      end

      config.to_prepare do
        module ::Refinery
          class << self
            attr_accessor :searchable_models

            def searchable_models
              @searchable_models ||= [(Refinery::Page if defined?(Refinery::Page))]
            end
          end
        end
      end
    end
  end
end
