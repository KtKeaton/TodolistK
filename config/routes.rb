Rails.application.routes.draw do
  resources :tasks, path: "mission_possible" do
    collection do
      get :search
      get :list
    end
  end

  resources :users, only: [:create] do
    collection do
      get :sign_up
      get :sign_in
    end
  end

  post "/users/sign_in", to: "sessions#create", as: "login"
	delete "/users", to: "sessions#destroy", as: "logout"
  
  root "users#sign_in"

end
