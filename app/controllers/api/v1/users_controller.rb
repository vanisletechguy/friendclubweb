module Api
	module V1
		class UsersController < ApplicationController
			respond_to :json	

			def index	#all users
				@users = User.all
				render json: {status: 'SUCCESS', message:'Loaded Users', data:@users}, status: :ok
			end

			def show #show 1 user
				@user = User.find(params[:id])
				render json: {status: 'SUCCESS', message:'Loaded User', data:@user}, status: :ok
			end

			def create #create new user
				#respond_with Post.create(params[:friendship])
			end
		
			def update #edit user profile
				#respond_with Post.update(params[:id], params[:friendship])
			end
			
			def destroy #destroy user account
				#respond_with Post.destroy(params[:id])
			end

			def my_friends #a users friends
				@all_users = User.all
				@api_user = @all_users.last ####uses last user in list, need to change
				#@friendships = @api_user.friends
				@friendships = @all_users  #currently shows all users ##change w/tokens
				render json: {status: 'SUCCESS', message:'Loaded friendships', data:@friendships}, status: :ok
			end


			def my_posts #all my posts
			end

			def news_feed #posts from my friends only
			end
		end
	end
end