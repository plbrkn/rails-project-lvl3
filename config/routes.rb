# frozen_string_literal: true

Rails.application.routes.draw do
  scope module: :web do
    root 'bulletins#index'

    resource :sessions, only: %i[new create destroy]
    resources :bulletins, except: :destroy do
      patch 'archive', on: :member
      patch 'moderate', on: :member
    end
    resources :users, only: %i[new create]

    get 'profile', to: 'profiles#index'

    namespace :admin do
      root 'home#index'
      resources :categories
      resources :users, only: %i[index edit update]
      resources :bulletins, except: :destroy do
        patch 'publish', on: :member
        patch 'reject', on: :member
        patch 'archive', on: :member
      end
    end

    post 'auth/:provider', to: 'auth#request', as: :auth_request
    get 'auth/:provider/callback', to: 'auth#callback', as: :callback_auth
  end
end
