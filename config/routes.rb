Rails.application.routes.draw do
  resources :tasks
  root "tasks#home"
  

end
