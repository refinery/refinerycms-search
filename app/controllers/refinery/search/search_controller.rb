require 'will_paginate/array'

module Refinery
  module Search
    class SearchController < ::ApplicationController

      before_action :find_page

      def show
        @results = Refinery::Search::SearchEngine.search(params[:query].try(:to_ascii))
        @results = @results.paginate(page: params[:page], per_page: Refinery::Search.results_per_page)
      end

      protected

        def find_page
          @page = Refinery::Page.find_by(link_url: Refinery::Search.page_url)
        end

    end
  end
end
