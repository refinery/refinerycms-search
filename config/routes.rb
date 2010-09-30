Refinery::Application.routes.draw do

  match "/search", :to => 'search#show', :as => 'search'

end