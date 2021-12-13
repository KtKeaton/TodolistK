Rails.application.routes.draw do
  resources :tasks, path: "togo"
  root "tasks#home"
  

end
