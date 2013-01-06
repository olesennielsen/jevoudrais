Jevoudrais::Application.routes.draw do
  resources :gifts
  
  get 'about' => 'home#about'
  get 'gift_creator' => 'home#gift_creator'  
  
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }  
  
  devise_scope :user do
    get '/users/auth/:provider' => 'users/omniauth_callbacks#passthru'
  end
    
  authenticated :user do
    root :to => 'home#index'
  end
  
  root :to => "home#new"    
end