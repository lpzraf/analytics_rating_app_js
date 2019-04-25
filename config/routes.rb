Rails.application.routes.draw do
  get 'courses/new'
  get 'courses/create'
  get 'courses/show'
  get 'courses/destroy'
  get 'categories/new'
  get 'categories/create'
  get 'students/new'
  get 'students/create'
  get 'students/show'
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
