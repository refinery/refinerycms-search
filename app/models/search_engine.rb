class SearchEngine
	
	# How many results should we show per page
	RESULTS_LIMIT = 10
	
	# Perform search over the specified models
	def self.search(query, page = 1)
		if query.present?
			results = []
			
			Refinery.searchable_models.each do |model|
				results << model.with_query(query).find(:all, :limit => RESULTS_LIMIT)
			end
			
			results.flatten[0..(RESULTS_LIMIT - 1)]
		else
			[] # not results for no query
		end
	end

end