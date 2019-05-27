Rails.application.routes.draw do  
  
  root 'appointments#index', as: 'home'
  
  get 'json' => 'pages#json'
  get 'json/:id' => 'pages#show' 

  #get 'appointments/:id' => 'appointments#my_appointments' 
  
  devise_for :users

  resources :appointments, :employees
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
