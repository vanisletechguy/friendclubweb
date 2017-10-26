class UsersController < ApplicationController
	# def my_portfolio
	# 	@user_stocks = current_user.stocks
	# 	@user = current_user
	# end

	def my_friends
		 @friendships = current_user.friends
		# respond_to do |format|
		# 	format.html
		# 	format.json { render json: @friendships }
		# end
	end

	def search
		@users = User.search(params[:search_param])
		if @users
			@users = current_user.except_current_user(@users)
			render partial: 'friends/lookup'
		else
			render status: :not_found, nothing: true
		end
	end

	def add_friend
		@friend = User.find(params[:friend])
		current_user.friendships.build(friend_id: @friend.id)
		if current_user.save
			redirect_to my_friends_path, notice: "Friend was successfully added."
		else
			redirect_to my_friends_path, flash[:error] = "There was an error with adding user as friend."
		end
	end

	def my_posts
		@user = current_user
		@posts = current_user.posts
		# @user_stocks = @user.user_stocks
	end

	def view_friend
		@current_friend = User.find(params[:friend])
	end

	def news_feed
		@posts = Post.all

		@all_posts = Post.all
		
		@all_posts.each do |post|

			if current_user.not_friends_with? post.user.id
				@posts -= [post]
			else
				#we are friends

			end
		end
				#@user = User.where(email: params[:user])
	end
	
	def show
		@user = User.find(params[:id])
	end
end
