Rails.application.routes.draw do
  root "home#index"

  resources :tests, path: "test", only: %i[show] do
    collection do
      get :start
    end

    member do
      post :answer
      post :back
      get :result
    end
  end
end
