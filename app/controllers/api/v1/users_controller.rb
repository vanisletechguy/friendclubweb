module Api
	module V1
		class UsersController < ApplicationController
			respond_to :json

			def index
				#all posts
				#respond_with User.all
				@users = User.all
				render json: {status: 'SUCCESS', message:'Loaded Users', data:@users}, status: :ok
			end

			def show
				#respond_with User.find(params[:id])

				@user = User.find(params[:id])
				render json: {status: 'SUCCESS', message:'Loaded User', data:@user}, status: :ok

			end

			def create
				#respond_with Post.create(params[:friendship])
			end
		
			def update
				#respond_with Post.update(params[:id], params[:friendship])
			end
			
			def destroy
				#respond_with Post.destroy(params[:id])
			end

			def my_friends
			end
		end
	end
end