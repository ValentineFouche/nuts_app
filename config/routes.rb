Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :recommendations, only: [ :show, :index, :edit, :update, :new, :create] do
    collection do
      get :searched
    end
    get 'movies_search', to: "recommendations#movies_search", as: :movies_search
  end
end
