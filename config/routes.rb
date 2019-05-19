Rails.application.routes.draw do
  resources :ratings
  get 'static_pages/home'
  root 'static_pages#home'
  get  '/courses', to: 'courses#index'
  get  '/contact', to: 'static_pages#contact'
  get  '/about',   to: 'static_pages#about'
  get  '/signup',  to: 'students#new'
  post '/signup',  to: 'students#create'
  get    '/login', to: 'sessions#new'
  post   '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/auth/facebook/callback' => 'sessions#create'


  resources :students

  resources :courses do
    resources :comments, :categories, :ratings
  end
end
