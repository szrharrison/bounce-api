Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resources :accounts, only: [:create, :delete, :update]
      resources :users, except: [:edit, :new]
      resources :projects, except: [:edit, :new] do
        resources :tasks, only: [:create]
      end
      resources :tasks, except: [:edit, :new]
    end
  end
end
