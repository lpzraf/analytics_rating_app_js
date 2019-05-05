Rails.application.routes.draw do
  get 'static_pages/home'
  root 'static_pages#home'
  get  '/help', to: 'static_pages#help'
  get  '/contact', to: 'static_pages#contact'
  get  '/about',   to: 'static_pages#about'
  get  '/signup',  to: 'students#new'
  post '/signup',  to: 'students#create'
  get    '/login', to: 'sessions#new'
  post   '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'


  #get 'sessions/login'
  #get 'sessions/signup'
  #get 'sessions/welcome'
  #delete 'sessions/logout'
  #root 'sessions#welcome'

  resources :students

  resources :courses do
    resources :comments
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
