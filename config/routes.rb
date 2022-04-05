Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :lists, only: [ :index, :show] do
    resources :recommendations, only: [ :new, :create]
  end
  resources :recommendations, only: [ :show, :index, :edit, :update] do
    collection do
      get :searched
    end
  end
end
