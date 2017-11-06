Rails.application.routes.draw do

  devise_for :users, :controllers => { :registrations => "user/registrations" }

	namespace :api, defaults: {format: 'json'} do 
  		namespace :v1 do
  			resources :users, :controllers => {:my_friends => "user/my_friends"}
			resources :users, :controllers => {:show => "user/show"}
  			resources :posts, :controllers => {:create => "posts/create"}
        resources :friendships

        # map.resources :users, :path_names => {:my_friends => 'my_friends'}
        get 'my_friends', to: 'users#my_friends'
        get 'show', to: 'users#show'
        post 'create', to: 'posts#create'

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
	post 'authenticate', to: 'authentication#authenticate'
	get 'test', to: 'welcome#test'
	get 'test2', to: 'welcome#test2'
	 #api auth token

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
