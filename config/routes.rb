Rails.application.routes.draw do
  get 'users/unsubscribe'
  get 'users/withdraw'
  devise_for :users
  root to: "homes#top"

  resources :reviews, only: [:new, :create, :index, :show, :edit, :destroy] do
    resources :review_comments, only: [:create, :destroy]
    resource :favorite, only: [:create, :destroy]
  end
  resources :users, only: [:show, :index, :edit, :update]

  get "/homes/about" => "homes#about", as: "about"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
