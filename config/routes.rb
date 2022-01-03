Rails.application.routes.draw do
  resources :tasks, path: "togo" do
    collection do
      get :search
    end
  end
  root "tasks#home"
end
