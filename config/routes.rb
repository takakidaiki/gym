Rails.application.routes.draw do
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
    get 'gyms/new'
    get 'gyms/index'
    get 'gyms/edit'
  end


  namespace :admin do
    get 'dashboards', to: 'dashboards#index'
    resources :users, only: [:destroy]
    resources :tags, only: [:index, :create, :edit, :update, :new, :destroy]
    resources :fitness_gyms, only: [:new, :index, :edit, :create, :update, :destroy]
  end

  scope module: :public do
    resources :fitness_gyms, only: [:show, :index, :create, :new] do
      resources :review_comments, only: [:create, :destroy]
      resource :favorite, only: [:create, :destroy]
    end
    
    resources :reviews, only: [:new, :create, :index, :show, :edit, :destroy, :update]
    get 'users/unsubscribe'
   
    resources :users, only: [:show, :index, :edit, :update, :destroy]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
