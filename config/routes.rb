Rails.application.routes.draw do

  	devise_for :users, :controllers => { :registrations => "user/registrations" }

  	resources :users, only: [:show]
  	resources :friendships
	resources :posts

  	root 'welcome#index'
	get 'my_friends', to: 'users#my_friends'
	get 'search_friends', to: 'users#search'
	post 'add_friend', to: 'users#add_friend'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
