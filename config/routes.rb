Rails.application.routes.draw do
  resources :tasks, path: "mission_possible" do
  end

  resources :users, only: [:create] do
    collection do
      get :sign_up
      get :sign_in
    end
  end

  root "tasks#index"

end
