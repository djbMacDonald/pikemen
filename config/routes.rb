Rails.application.routes.draw do
  devise_for :users
  authenticated :users do
    root to: 'reports#index', as: :authenticated_root
  end
  root 'welcome#index'
  resources :agencies do
    resources :reports do
    end
  end
  resources :reports
  get '/reports/check', to: 'reports#check'
  get '/users/:id', to: 'users#show', as: 'user'
end
