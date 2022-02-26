# frozen_string_literal: true

Rails.application.routes.draw do
  scope module: :web do
    root 'bulletins#index'

    resource :sessions, only: %i[new create destroy]
    resources :bulletins, except: :destroy
    resources :users, only: %i[new create]

    post 'auth/:provider', to: 'auth#request', as: :auth_request
    get 'auth/:provider/callback', to: 'auth#callback', as: :callback_auth
  end
end
