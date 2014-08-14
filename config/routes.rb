Rails.application.routes.draw do
  get 'map_display/index'

  match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]
  root to: 'welcome#index'
  get 'welcome/friends', to: 'welcome#fetch_friend_data', as: 'fetch_friends'
end
