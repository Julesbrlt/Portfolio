Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: "users/sessions" }, skip: [:registrations]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: "pages#home"
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  resources :projects

  resource :resume, only: [:show, :edit, :update]
  resources :experiences, only: [:new, :create, :edit, :update, :destroy]
  resources :educations, only: [:new, :create, :edit, :update, :destroy]
  resources :skills, only: [:new, :create, :destroy]
  resources :languages, only: [:edit, :update]
  resources :interests, only: [:new, :create, :destroy]

end
