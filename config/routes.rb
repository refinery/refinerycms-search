Refinery::Core::Engine.routes.draw do
  match "/search", :to => 'search#show', :as => 'search'
end
