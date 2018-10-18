Rails.application.routes.draw do
  devise_for :users
 root 'static_pages#index'
  get "/games/:game" => "games#show"
 root 'games#index'
 resources :games
end
