# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations',
  passwords: "users/passwords", confirmations: 'users/confirmations'}
  resources :users
  resources :sources
  resources :articles
  root to: 'articles#index'
  get 'news_fetchers/fetch_news', to: 'news_fetchers#fetch_news'
  get 'news_fetchers/fetch_sources', to: 'news_fetchers#fetch_sources'
  get 'news_fetchers/news_send', to: 'news_fetchers#news_send'
end
