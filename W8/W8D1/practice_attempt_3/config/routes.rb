Rails.application.routes.draw do

  resources :users, only: [:index, :show, :new, :create] do 
    resources :goals, only: [:create]
  end

  resources :goals, only: [:destroy]

  resource :session, only: [:new, :create, :destroy]

end
