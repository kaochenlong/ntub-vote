Rails.application.routes.draw do
  root "welcome#index"
  resources :candidates do
    member do
      post :vote
    end
  end
end
