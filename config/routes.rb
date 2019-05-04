Rails.application.routes.draw do
  get 'static_pages/home'
  get 'static_pages/help'
  get 'static_pages/contact'
  get 'sessions/login'
  get 'sessions/signup'
  #get 'sessions/welcome'
  delete 'sessions/logout'
  root 'sessions#welcome'

  resources :students

  resources :courses do
    resources :comments
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
