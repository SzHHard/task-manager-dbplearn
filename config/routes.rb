Rails.application.routes.draw do
  root :to => "web/boards#show"

  namespace :admin do
    resources :users
  end

  scope module: :web do
    resources :developers, only: [:new, :create]
    resource :board, only: :show
    resource :session, only: [:new, :create, :destroy]
  end
end
