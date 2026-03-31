Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  root "images#index"

  resources :images, except: [:edit, :destroy, :update] do
    member do
      get :histogram
    end
  end
end
