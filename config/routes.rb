Rails.application.routes.draw do
  get "budget_projects/index"
  get "budget_projects/new"
  get "budget_projects/create"
  get "budget_projects/show"
  get "votes/create"
  namespace :admin do
      resources :budget_categories
      resources :budget_projects
      resources :impact_metrics
      resources :phases
      resources :votes

      root to: "budget_categories#index"
    end
  devise_for :admins
  mount RailsAdmin::Engine => '/app', as: 'rails_admin'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
