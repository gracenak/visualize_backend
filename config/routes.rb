Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :visions, only: [:index, :create, :update, :destroy]
      resources :themes, only: [:index]
    end
  end
end
