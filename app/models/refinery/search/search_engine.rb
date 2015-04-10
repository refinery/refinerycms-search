module Refinery
  module Search
    class SearchEngine

      # Perform search over the specified models
      def self.search(query)
        results = []

        Refinery::Search.config.enable_for.each do |model|
          model = model.safe_constantize

          if model.respond_to?(:refinery_search_scope)
            results << model.refinery_search_scope.with_query(query)
          else
            results << model.with_query(query)
          end
        end if query.present?

        results.flatten
      end

    end
  end
end
