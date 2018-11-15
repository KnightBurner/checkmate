Rails.application.routes.draw do
  devise_for :users
 root 'games#index'
 resources :chess_pieces, only:[:update]

end
