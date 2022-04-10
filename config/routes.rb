Rails.application.routes.draw do
  resources :tasks, path: "mission_possible" do
    collection do
      get :list
    end
  end

  resources :users, only: [:create] do
    collection do
      get :sign_up
      get :sign_in
    end
  end

  resources :categories, only: [:index]

  post "/users/sign_in", to: "sessions#create", as: "login"
	delete "/users", to: "sessions#destroy", as: "logout"

  root "users#sign_in"

  # API
	# POST /api/v1/notes/2/favorite
	namespace :api do
		namespace :v1 do
			resources :tasks, only: [] do
				member do
					post :favorite
				end
			end
		end
	end
end
