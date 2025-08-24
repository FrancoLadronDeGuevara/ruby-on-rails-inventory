Rails.application.routes.draw do
  root "dashboard#index"
  get "up" => "rails/health#show", as: :rails_health_check
  resources :products do
    member do
      get :new_movement
      post :create_movement
    end
  end
end
