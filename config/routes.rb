Jevoudrais::Application.routes.draw do
  resources :gifts

  authenticated :user do
    root :to => 'home#index'
  end  
  devise_for :users
  
  devise_scope :user do
    root to: "devise/sessions#new"
  end
  
  resources :users
end