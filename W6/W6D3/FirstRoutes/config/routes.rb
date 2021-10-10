Rails.application.routes.draw do
  get "/users/:user_id/artworks", to: "artworks#index"
  resources :users, only: [:index, :create, :show, :update, :destroy] do
    collection do 
      get :search, to: "user#index"
    end
  end
  resources :artworks, only: [:create, :show, :update, :destroy]
  resources :artwork_shares, only: [:create, :destroy]
  resources :comments, only: [:create, :destroy, :index]
end
