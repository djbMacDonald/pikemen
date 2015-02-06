Rails.application.routes.draw do
  root 'welcome#index'
  resources :reports, except: [:edit, :update, :destroy]
end
