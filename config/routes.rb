Jevoudrais::Application.routes.draw do
  resources :gift_templates
  resources :gifts
  resources :events
  
  get 'about' => 'home#about'
  get 'gift_creator' => 'home#gift_creator'  
  post 'give' => 'gifts#give'
  get '/get_giver/:id' => 'gifts#get_giver'
  post 'remove_gift' => 'gifts#remove_gift'
  put '/notifications/:id' => 'notifications#update'
  get '/search' => 'home#search' 
  
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }  
  
  devise_scope :user do
    get '/users/auth/:provider' => 'users/omniauth_callbacks#passthru'
  end
    
  authenticated :user do
    root :to => 'home#index'
  end
  
  root :to => "home#new"    
end