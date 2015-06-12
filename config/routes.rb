Rails.application.routes.draw do
  devise_scope :user do
    root to: 'devise/sessions#new'
  end

  devise_for :users

  resources :visits do
    get 'output', on: :member
  end

  resources :offices do
    resources :staffs
  end

  resources :position
  resources :logbooks

  get '/logbooks/:logbook_id/offices/:office_id/staffs', to: 'staffs#staffs_logbook'
  get '/office/visits/:id', to: 'offices#visits', as: 'office_visits'
  get '/report', to: 'reports#report', as: 'reports'
  get '/search', to: 'visits#search', as: 'search_logbook'
end
