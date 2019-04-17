# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }
  resources :users
  resources :sources
  resources :articles
  root to: 'articles#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end