Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'
  resources :agencies, except: [:index, :edit, :update, :destroy]
  get '/reports/check', to: 'reports#check'
  resources :reports, except: :show
  get '/users/:id', to: 'users#show', as: 'user'
  get '*path', to: 'welcome#index'
end
