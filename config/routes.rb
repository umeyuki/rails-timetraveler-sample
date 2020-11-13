Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "home#index"
  resources :home
  resource :time_travel, only: [:create] if Rails.env.development? || Rails.env.staging?
end
