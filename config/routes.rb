# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :patients

  unauthenticated :patient do
    root to: 'devise/session#new'
  end

  authenticated :patient do
    root to: 'dashboard#index'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
