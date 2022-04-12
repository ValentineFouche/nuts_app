Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: :show
  resources :recommendations, only: [ :show, :index, :edit, :update, :new, :create] do
    collection do
      get :searched
      get :viewed
    end
    get 'movies_search', to: "recommendations#movies_search", as: :movies_search
  end

  resources :bookrecoms, only: [ :show, :index, :edit, :update, :new, :create] do
    collection do
      get :searched
      get :viewed
    end
    get 'books_search', to: "bookrecoms#books_search", as: :books_search
  end

  resources :podcastrecoms, only: [ :show, :index, :edit, :update, :new, :create] do
    collection do
      get :searched
      get :viewed
    end
    get 'podcasts_search', to: "podcastrecoms#podcasts_search", as: :podcasts_search
  end

  resources :restaurantrecoms, only: [ :show, :index, :edit, :update, :new, :create] do
    collection do
      get :searched
      get :viewed
    end
    get 'restaurant_search', to: "restaurantrecoms#restaurants_search", as: :restaurants_search
  end

  resources :restaurants, only: [:index, :create, :new]
end
