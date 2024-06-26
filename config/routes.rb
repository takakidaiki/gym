Rails.application.routes.draw do
  devise_for :admin, skip: [:registrations, :password], controllers: {
    sessions: 'admin/sessions'
  }

  namespace :admin do
    get 'dashboards', to: 'dashboards#index'
    resources :users, only: [:destroy]
  end

  scope module: :public do
    resources :fitness_gyms, only: [:show, :index, :create]
    resources :reviews, only: [:new, :create, :index, :show, :edit, :destroy, :update] do
      resources :review_comments, only: [:create, :destroy]
      resource :favorite, only: [:create, :destroy]
    end
    get 'users/unsubscribe'
    get "/homes/about" => "homes#about", as: "about"
    root to: "homes#top"
    devise_for :users
    resources :users, only: [:show, :index, :edit, :update, :destroy]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
