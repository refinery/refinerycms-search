module Refinery
  class SearchController < ::ApplicationController

    # Display search results given the query supplied
    def show
      @page_number = params[:page].nil? ? 1 : params[:page].to_i
      @search = Refinery::SearchEngine.search(params[:query], @page_number)
      @count = @search[:count]
      @results = @search[:results]
      present(@page = Refinery::Page.find_by_link_url("/search"))
    end

  end
end
