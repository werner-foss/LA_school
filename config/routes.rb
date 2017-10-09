Rails.application.routes.draw do
  
  resources :comments
  resources 'contacts', only: [:new, :create], path_names: { new: '' }
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register'}
  
  resources :questions
  
  resources :adults do
    put :sort, on: :collection
  end
  
  resources :kids do
    put :sort, on: :collection
  end
  
  resources :news do
    member do
     get :toggle_status
    end 
  end
  
  root to: 'pages#home'

  get 'courses', to: 'pages#courses'
  
  get 'about', to: 'pages#about'

end
