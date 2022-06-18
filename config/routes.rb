Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  resources :books
  resources :users, only: [:show, :edit, :index]
  get "/homes/about" => "homes#about", as: "about"
end
