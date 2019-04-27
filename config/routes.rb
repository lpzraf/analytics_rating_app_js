Rails.application.routes.draw do
  # get 'courses/new'
  # get 'courses/create'
  # get 'courses/show'
  # get 'courses/destroy'
  # get 'categories/new'
  # get 'categories/create'
  # get 'students/new'
  # get 'students/create'
  # get 'students/show'
   get 'sessions/login'
   get 'sessions/signup'
   get 'sessions/welcome'

resources :students

resources :courses do
  resources :categories
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
