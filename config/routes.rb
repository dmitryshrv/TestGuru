Rails.application.routes.draw do

  root to: "tests#index"

  resource :feedback, only: %i[new create]

  devise_for :users, path_names: {sign_in: :login, sign_out: :logout}

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

  resources :badges, only: :index

  namespace :admin do
    resources :gists, only: :index
    resources :badges

    resources :tests do
      patch :update_inline, on: :member
      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end

  end

end
