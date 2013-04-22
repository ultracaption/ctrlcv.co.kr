EwhaNote::Application.routes.draw do
  devise_for :users, controllers: { sessions: 'user_sessions' }

  resources :lectures do
    get :search, on: :collection
    resources :assessments
  end

  resources :assessments do
    get :mine, on: :collection
  end

  resources :registrations do
    resources :users, only: [:create]
  end

  resources :bookmarks
  root :to => 'assessments#index'
end
