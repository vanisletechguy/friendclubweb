Rails.application.routes.draw do

  	devise_for :users, :controllers => { :registrations => "user/registrations" }

	namespace :api, defaults: {format: 'json'} do 
  		namespace :v1 do
  			resources :posts
  			resources :users
  		end
  	end
  	
  	resources :users, only: [:show]
  	resources :friendships
	resources :posts

  	root 'welcome#index'
	get 'my_friends', to: 'users#my_friends'
	get 'search_friends', to: 'users#search'
	post 'add_friend', to: 'users#add_friend'
	get 'my_posts', to: 'users#my_posts'
	get 'view_friend', to: 'users#view_friend'
	get 'news_feed', to: 'users#news_feed'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
