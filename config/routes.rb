Rails.application.routes.draw do
  devise_scope :user do
    root to: 'devise/sessions#new'
  end

  devise_for :users

  resources :visits do
    get 'output', on: :member
  end

  resources :offices
  resources :logbooks

  get '/reports', to: 'reports#show', as: 'reports'
  get '/search', to: 'visits#search', as: 'search_logbook'
end
