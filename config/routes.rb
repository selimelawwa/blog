Rails.application.routes.draw do
  resources :users
  root 'welcome#index'
  #get 'welcome/index'  #might comment it?
 
resources :articles do
  resources :comments
end

  
end
