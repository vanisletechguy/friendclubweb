module Api
	module V1
		class PostsController < ApplicationController
			#skip_before_action :verify_authenticity_token
			respond_to :json
			
			def index
				#all posts
				#respond_with Post.all
				#@posts = Post.all
				#render json: {status: 'SUCCESS', message:'Loaded Posts', data:@posts}, status: :ok
			


##################################

				@posts = Post.all
				@all_posts = Post.all
				@all_posts.each do |post|
					if current_user.not_friends_with? post.user.id && post.user.id != current_user.id
						@posts -= [post]
					else
						#we are friends

					end
				end
				render json: {status: 'SUCCESS', message:'Loaded Posts', data:@posts}, status: :ok



			end

			def show
				#respond_with Post.find(params[:id])
				@post = Post.find(params[:id])
				render json: {status: 'SUCCESS', message:'Loaded Post', data:@post}, status: :ok
			end

			def create		
				@api_user = @current_user
				if @api_user
					@post = @api_user.posts.build(post_params)
					if @post.save #@post.save
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
				json = JSON.parse(request.raw_post)
				params = ActionController::Parameters.new(json)
				params.permit(:title, :content, :longitude, :latitude, :image)
			end
		end
	end
end