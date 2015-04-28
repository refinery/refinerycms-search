Refinery::Core::Engine.routes.draw do
  namespace :search, path: Refinery::Search.page_url do
    root to: 'search#show'
  end
end