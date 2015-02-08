Rails.application.routes.draw do
  devise_for :users
  authenticated :users do
    root to: 'reports#index', as: :authenticated_root
  end
  root 'welcome#index'
  resources :reports, except: [:show, :edit, :update, :destroy]
  get '/reports/check', to: 'reports#check'
end
