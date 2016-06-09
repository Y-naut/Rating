Rails.application.routes.draw do
  devise_for :users
  resources :venues do 
  	resources :reviews
  end
  
  root 'venues#index'
end
