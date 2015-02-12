Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'
  resources :agencies do
    resources :reports, except: :show
  end
  get '/reports/check', to: 'reports#check'
  resources :reports, except: :show
  get '/users/:id', to: 'users#show', as: 'user'
  get '*path', to: 'welcome#index'
end
