Rails.application.routes.draw do
  root 'tops#index'

  resources :users
  resources :events do
    collection do
      post :confirm
    end
  end
  resources :tops
  resources :sessions
  resources :favorites, only: [:create, :destroy]

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
