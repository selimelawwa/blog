Rails.application.routes.draw do
  root 'welcome#index'
  #get 'welcome/index'  #might comment it?
 
resources :articles do
  resources :comments
end

  
end
