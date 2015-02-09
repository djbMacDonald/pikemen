Rails.application.routes.draw do
  devise_for :users
  authenticated :users do
    root to: 'reports#index', as: :authenticated_root
  end
  root 'welcome#index'
    resources :agencies do
      resources :reports, except: [:show] do
      end
    end
    resources :reports, except: [:show]
  get '/reports/check', to: 'reports#check'
end
