module Refinery
  class SearchEngine

    # How many results should we show per page
    RESULTS_LIMIT = 10

    # Perform search over the specified models
    def self.search(query)
      results = []

      Refinery.searchable_models.each do |model|
        results << model.with_query(query)
      end if query.present?

      results.flatten
    end

  end
end
