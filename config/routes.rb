Refinery::Core::Engine.routes.draw do
  get "/search", :to => 'search#show', :as => 'search'
end
