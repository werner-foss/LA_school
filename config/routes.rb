Rails.application.routes.draw do
  resources :questions
  resources :adults
  resources :kids
  
  resources :news do
    member do
     get :toggle_status
    end 
  end
  
  root to: 'pages#home'

  get 'courses', to: 'pages#courses'

  get 'contact', to: 'pages#contact'
  
  get 'about', to: 'pages#about'

end
