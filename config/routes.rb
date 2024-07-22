Rails.application.routes.draw do
<<<<<<< Updated upstream
  root to: "items#index"
  devise_for :users
  resources :items, only: [:index, :new, :create, :show, :destroy, :edit, :update] do
    resources :orders, only: [:index, :create]
  end
=======
  get 'items/index'
  root to: "items#index"
>>>>>>> Stashed changes
end
