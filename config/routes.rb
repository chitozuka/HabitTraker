Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :habits do
    resources :progresses, only: [:create, :destroy]
    # post 'create_progress', on: :member
    # post 'progress/:date', to: 'progresses#create', as: 'create_progress'
    # delete 'progress/:date', to: 'progresses#destroy', as: 'destroy_progress'
  end

  root to: 'habits#index'
end
