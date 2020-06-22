Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'jobs#index'

  resources :customers do
    member do
      get 'select'
    end
  end

  resources :monthly_summaries

  resources :job_types

  resources :jobs do
    collection do
      get 'report'
      get 'search'
      post 'search'
    end
  end

end
