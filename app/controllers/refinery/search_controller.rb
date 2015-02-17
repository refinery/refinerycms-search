module Refinery
  class SearchController < ::ApplicationController

    require 'will_paginate/array'

  	# Display search results given the query supplied
    def show
      @results = Refinery::SearchEngine.search(params[:query])

      @results = @results.paginate(:page => params[:page], :per_page => Refinery::SearchEngine::RESULTS_LIMIT)

      present(@page = Refinery::Page.find_by_link_url("/search"))
    end

  end
end
