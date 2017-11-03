module Api
	module V1
		class PostsController < ApplicationController
			#skip_before_action :verify_authenticity_token
			respond_to :json


			def index
				#all posts
				#respond_with Post.all
				
				@posts = Post.all
				render json: {status: 'SUCCESS', message:'Loaded Posts', data:@posts}, status: :ok

			end

			def show
				#respond_with Post.find(params[:id])

				@post = Post.find(params[:id])
				render json: {status: 'SUCCESS', message:'Loaded Post', data:@post}, status: :ok

			end

			def create
				#respond_with Post.create(params[:friendship])
			
				#@user = User.where(email: params[:user]).first
				@all_users = User.all
				@api_user = @all_users.find_by_email(params[:email])
				#@api_user = @all_users.first
				#if (@user = User.find_by_email(params[:user][:email])) && @user.valid_password?(params[:user][:password])


				if @api_user
					@post = @api_user.posts.build(post_params)

					if @post.save
						render json: {status: 'SUCCESS', message:'Saved Post', data:@post}, status: :ok
					else
						render json: {status: 'ERROR', message:'Post Not Saved', data:@post}, status: :unprocessable_entity
					end
				end

			    
			end
		
			def update
				respond_with Post.update(params[:id], params[:friendship])
			end
			
			def destroy
				respond_with Post.destroy(params[:id])
			end

			private

			def post_params
				params.permit(:title, :content, :longitude, :latitude)### fix
			end
		end
	end
end