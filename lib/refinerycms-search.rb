require 'refinery'

module Refinery
  module Search
    class Engine < Rails::Engine
      config.to_prepare do
        module ::Refinery
          class << self
            attr_accessor :searchable_models

            def searchable_models
              @searchable_models ||= [Page]
            end
          end
        end
      end

      config.after_initialize do
        ::Refinery::Plugin.register do |plugin|
          plugin.name = 'refinerycms_search'
          plugin.version = 1.0
          plugin.hide_from_menu = true
        end
      end
    end
  end
end