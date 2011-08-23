module Refinery
  class SearchEngine

    # How many results should we show per page
    RESULTS_LIMIT = 10

    # Perform search over the specified models
    def self.search(query, page = 1)
      results = []

      Refinery.searchable_models.each do |model|
        results << model.limit(RESULTS_LIMIT).with_query(query)
      end if query.present?

      results.flatten[0..(RESULTS_LIMIT - 1)]
    end

  end
end
