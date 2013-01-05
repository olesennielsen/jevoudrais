Jevoudrais::Application.routes.draw do
  resources :gifts

  authenticated :user do
    root :to => 'home#index'
  end  
  
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  
  devise_scope :user do
    root to: "devise/sessions#new"
  end
  
  get 'about' => 'home#about'
  get 'gift_creator' => 'home#gift_creator'
  
  resources :users
end