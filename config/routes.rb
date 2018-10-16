Rails.application.routes.draw do
  devise_for :users
 root 'static_pages#index'
<<<<<<< HEAD
  get "/games/:game" => "games#show"
=======
 root 'games#index'
>>>>>>> d8f03fa06a3d4c1b14d3ec5fd623a8b143ea968f
 resources :games
end
