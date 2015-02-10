Rails.application.routes.draw do
  devise_for :users
  authenticated :users do
    root to: 'reports#check', as: :authenticated_root
  end
  root 'welcome#index'
  resources :agencies do
    resources :reports do
    end
  end
  get '/reports/check', to: 'reports#check'
  resources :reports
  get '/users/:id', to: 'users#show', as: 'user'
end
