module Refinery
  class SearchController < ::ApplicationController

  	# Display search results given the query supplied
    def show
      query = params[:query]
      @page_number = params[:page].nil? ? 1 : params[:page].to_i
      @search = Refinery::SearchEngine.search(query, @page_number)
      @results = @search[:results]
      @count = @search[:count]

      present(@page = Refinery::Page.find_by_link_url("/search"))
    end

  end
end
