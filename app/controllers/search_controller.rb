class SearchController < ApplicationController

  before_filter :find_page
	
	# Display search results given the query supplied
  def show
    @results = SearchEngine.search(params[:query], params[:page])
    present(@page)
  end

protected

  def find_page
    @page = Page.find_by_link_url("/search")
  end

end