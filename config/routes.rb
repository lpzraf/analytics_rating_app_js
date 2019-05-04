Rails.application.routes.draw do
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
