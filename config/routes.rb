Rails.application.routes.draw do
  
  
  root to: 'home#top'
  devise_for :users
  get "home/about" => "home#about", as: "about"
  resources :books
  resources :users

end
