Rails.application.routes.draw do
  root :to => "web/boards#show"

  namespace :admin do
    resources :users
  end

  namespace :api do
    namespace :v1 do
      resources :tasks, only: [:index, :show, :create, :update, :destroy]
    end
  end

  scope module: :web do
    resources :developers, only: [:new, :create]
    resource :board, only: :show
    resource :session, only: [:new, :create, :destroy]
  end
end
