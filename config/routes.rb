Rails.application.routes.draw do
  resources :questions
  resources :adults
  resources :kids
  resources :news
  get 'pages/home'

  get 'pages/courses'

  get 'pages/contact'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
