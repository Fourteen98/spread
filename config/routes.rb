Rails.application.routes.draw do
  devise_for :users
  root "users#index"
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create, :destroy] do
      resources :comments, only: [:new, :create, :destroy]
      resources :likes, only:  [:create]
    end
  end

  # API routes
  namespace :api do
    namespace :v1 do
      resources :users do
        resources :posts, format: :json do
          resources :comments, format: :json
        end
      end
    end
  end

end


