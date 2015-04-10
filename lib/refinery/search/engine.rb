module Refinery
  module Search
    class Engine < Rails::Engine
      include Refinery::Engine

      isolate_namespace Refinery::Search

      initializer "register refinerycms_search plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.pathname = root
          plugin.name = 'refinerycms_search'
          plugin.hide_from_menu = true
        end
      end

      config.to_prepare do
        module ::Refinery
          class << self
            attr_accessor :searchable_models

            def searchable_models
              Refinery.deprecate("Refinery.searchable_models", when: "3.1", replacement: "Refinery::Search.enable_for")
              Refinery::Search.enable_for
            end

            def searchable_models=(value)
              Refinery.deprecate("Refinery.searchable_models=", when: "3.1", replacement: "Refinery::Search.enable_for")
              Refinery::Search.enable_for = value
            end
          end
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Search)
      end
    end
  end
end
