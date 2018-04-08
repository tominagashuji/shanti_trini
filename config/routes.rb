Rails.application.routes.draw do
  resources :users
  get 'sessions/index'

  root 'tops#index'

  resources :events

  resources :events do
    collection do
      post :confirm
    end
  end

  resources :tops
  resources :sessions
  resources :favorites, only: [:create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # if Rails.env.development?
  #   mount LetterOpenerWeb::Engine, at: "/letter_opener"
  # end
end
