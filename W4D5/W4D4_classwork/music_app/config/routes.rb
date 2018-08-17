Rails.application.routes.draw do

  resources :users
  resource :sessions
  resources :bands do
    resources :albums, only: :new
  end

  resources :albums, only: [:create, :edit, :update, :destroy, :show]

end
