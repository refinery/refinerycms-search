Refinery::Application.routes.draw do
  scope(:module => :refinery) do
    match "/search", :to => 'search#show', :as => 'search'
  end
end
