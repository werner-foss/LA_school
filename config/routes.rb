Rails.application.routes.draw do
  devise_for :users
  
  resources :questions
  
  resources :adults
  
  get 'business-course', to: 'adults#business'
  
  get 'general-course', to: 'adults#general'
  
  get 'specialized-course', to: 'adults#specialized'
  
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
