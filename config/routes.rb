Rails.application.routes.draw do

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
    end
  end

end
