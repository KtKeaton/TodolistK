Rails.application.routes.draw do
  resources :tasks, path: "togo" do

  end
  root "tasks#home"
end
