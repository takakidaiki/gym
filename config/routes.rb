Rails.application.routes.draw do
  get 'users/sessions'
  root to: "public/homes#top"
  get "/homes/about" => "public/homes#about", as: "about"
  devise_for :admin, skip: [:registrations, :password], controllers: {
    sessions: 'admin/sessions'
  }

  devise_for :users, controllers: {
    sessions: 'public/sessions',
    registrations: 'public/registrations',
  }

  namespace :admin do
    get 'users', to: 'users#index'
    patch 'users/:id/withdraw',to: "users#withdraw", as: "users_withdraw"
    resources :tags, except: [:show]
    resources :fitness_gyms do
      resources :reviews, only: [:show, :destroy]
    end
  end

  scope module: :public do
    resources :fitness_gyms, only: [:show, :index, :create]
    resources :reviews do
      resources :review_comments, only: [:create, :destroy]
      resource :favorite, only: [:create, :destroy]
    end
    get 'users/unsubscribe'
    patch 'users/withdraw'
    
    devise_scope :user do
      post "users/guest_sign_in", to: "sessions#guest_sign_in"
    end
    
    resources :users, only: [:show, :edit, :update]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
