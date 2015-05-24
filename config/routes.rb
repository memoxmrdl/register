Rails.application.routes.draw do
  devise_scope :user do
    root to: 'devise/sessions#new'
  end

  devise_for :users

  resources :offices

  resources :visits do
    get 'output', on: :member
  end

  resources :logbooks

  get '/search', to: 'visits#search', as: 'search_logbook'
end
