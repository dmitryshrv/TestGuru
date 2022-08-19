Rails.application.routes.draw do

  root to: "tests#index"

  devise_for :users, path_names: {sign_in: :login, sign_out: :logout}
              # controllers: { registrations: 'registrations'}
  #devise_for :users, controllers: { registrations: 'users/registrations' }

  resources :tests, only: :index do
    member do
      post :start
    end
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
      post :gist
    end
  end

  namespace :admin do
    resources :gists, only: :index
    resources :tests do
      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end
  end

end
