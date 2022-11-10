Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  get "/homes/about" => "homes#about", as: "about"
  get "/homes/top" => "homes#top", as: "top"
  resources :books, only:[:new,:create,:index]
  get "/users" => "users#show"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
