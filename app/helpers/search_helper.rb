module SearchHelper
	
	# this is where you register your result URLs based on the
	# type of result we're dealing with
	def result_url(result)
		result.respond_to?(:url) ? result.url : url_for(result)
	end
	
end