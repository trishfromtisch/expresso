Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'users#new'
  get "/home" => "posts#new"
  get "/session/new" => "session#new"
  post "/session" => "session#create"
  delete "/session" => "session#destroy"
  get "/posts/location" => "posts#location_cool"
  get "/coveted_coffees" => "coveted_coffees#index"
  get "/coveted_coffees/:id" => "coveted_coffees#show" 
  post "/coveted_coffees" => "coveted_coffees#create"
  delete "/coveted_coffees/:id" => "coveted_coffees#destroy"
  get "/posts/:id/coveted_coffees" => "posts#coveted_coffees"
  get "/likes/:id" => "likes#show"
  post "/likes" => "likes#create"
  delete "/likes/:id" => "likes#destroy"



  resources :users, :coffee_bars, :comments, :posts, :relationships
  
end