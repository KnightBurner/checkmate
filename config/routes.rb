Rails.application.routes.draw do
  devise_for :users
 root 'games#index'
 resources :games 
 resources :chess_pieces

end
