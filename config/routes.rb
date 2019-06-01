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
  get  '/top_rated_courses', to: 'courses#top_rated_courses'



  resources :students

  resources :courses do
    resources :categories, :ratings, :only => [:new, :index, :create]
  end
end
