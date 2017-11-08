module Api
	module V1
		class PostsController < ApplicationController
			#skip_before_action :verify_authenticity_token
			respond_to :json
			
			def image_data_provided?
				!self.image.blank?
			end


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
				##@all_users = User.all
				##@api_user = @all_users.find_by_email(params[:email])
				#@api_user = @all_users.first
				#if (@user = User.find_by_email(params[:user][:email])) && @user.valid_password?(params[:user][:password])
				@api_user = @current_user
				if @api_user
					#@post = new Post(post_params)

					#@post = Post.create(post_params)

					

					#@image = decode_image_data(params[:image_data])

					#@api_user.posts.build(post_params)
					@post = @api_user.posts.build(post_params)
					#@post.image = @image



					#@post_image = decode_image_data(post_params[:image_data])
					
					#@post = @api_user.posts.build(post_params)
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
				#@image = decode_image_data(params[:image])
				params.permit(:title, :content, :longitude, :latitude, :image)### fix
				#params[:image] = @image
				#params[:image] = decode_image_data(params[:image])
			end

			# def decode_image_data 
			# 	# decode the base64
			# 	data = StringIO.new(Base64.decode64(self.image))
			# 	# assign some attributes for carrierwave processing
			# 	data.class.class_eval { attr_accessor :original_filename, :content_type }
			# 	data.original_filename = SecureRandom.hex(16) + ".png"
			# 	data.content_type = "image/png"
			# 	self.image = data
			# 	# return decoded data
			# 	data
			# end
		end
	end
end