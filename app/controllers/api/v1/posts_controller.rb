module Api
	module V1
		class PostsController < ApplicationController
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
			
			    @post = User.first.posts.build(post_params)


				if @post.save
					render json: {status: 'SUCCESS', message:'Saved Post', data:@post}, status: :ok
				else
					render json: {status: 'ERROR', message:'Post Not Saved', data:@post}, status: :unprocessable_entity
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