ActionController::Routing::Routes.draw do |map|
	
  map.search "/search", :controller => 'search', :action => 'show'

	map.resource :search_result, :controller => 'search'
	
end