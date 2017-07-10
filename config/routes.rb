Rails.application.routes.draw do
  resources :questions
  resources :adults
  resources :kids
  resources :news
  
  root to: 'pages#home'

  get 'courses', to: 'pages#courses'

  get 'contact', to: 'pages#contact'

end
