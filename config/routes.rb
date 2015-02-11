Rails.application.routes.draw do
  devise_for :users
  authenticated :users do
    root to: 'reports#check', as: :authenticated_root
  end
  root 'welcome#index'
  resources :agencies do
    resources :reports, except: :show
  end
  get '/reports/check', to: 'reports#check'
  resources :reports, except: :show
  get '/users/:id', to: 'users#show', as: 'user'
end
