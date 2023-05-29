Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :habits do
    resources :progresses, only: [:create, :destroy]
    post 'create_progress', on: :member
  end

  root to: 'habits#index'
end
