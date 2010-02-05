module SearchHelper
	
	# this is where you register your result URLs based on the
	# type of result we're dealing with
	def result_url(result)
		table_name = result.class.to_s.tableize
		case table_name
		when "news_items"
			"/news/#{result.to_param}"
		else
			"/#{table_name}/#{result.to_param}"
		end
	end
	
end