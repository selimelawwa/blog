Rails.application.routes.draw do
  resources :users
  root 'welcome#index'
  #get 'welcome/index'  #might comment it?
  
  get 'login', to: 'sessions#new'
  post 'login', to:  'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :categories, except: [:destroy]
resources :articles do
  resources :comments
end


end
