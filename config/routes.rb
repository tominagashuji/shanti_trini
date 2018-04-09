Rails.application.routes.draw do
  resources :users
  resources :events

  root 'tops#index'

  resources :events do
    collection do
      post :confirm
    end
  end

  resources :tops
  resources :sessions
  resources :favorites, only: [:create, :destroy]

  # if Rails.env.development?
  #   mount LetterOpenerWeb::Engine, at: "/letter_opener"
  # end
end
