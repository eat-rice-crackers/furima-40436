Rails.application.routes.draw do
  root to: "items#index"
  devise_for :users
  resources :items, only: [:index, :new, :create, :show, :destroy, :edit, :update] do
    resources :orders, only: [:index, :create]
  end
end
