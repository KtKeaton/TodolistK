Rails.application.routes.draw do
  resources :tasks, path: "mission_possible" do

  end
  root "tasks#index"
end
