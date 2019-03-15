# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  get '/welcome', to: 'welcome#index'
  get '/services', to: 'services#index'
  get '/dashboard', to: 'dashboard#index'

  unauthenticated :user do
    devise_scope :user do
      root to: 'devise/sessions#new'
    end
  end

  authenticated :user do
    devise_scope :user do
      root to: 'welcome#index'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
