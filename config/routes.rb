Rails.application.routes.draw do
  devise_for :users
 root 'static_pages#index'
 root 'games#index'
 resources :games
end
