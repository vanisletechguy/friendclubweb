# module Api
# 	module V1
		# class Api::V1::BaseAPI < ApplicationController
		# 	acts_as_token_authentication_handler_for User
		# 	before_action :authenticate_request 
		# 	attr_reader :current_user 

		# 	private 

		# 	def authenticate_request 
		# 		@current_user = AuthorizeApiRequest.call(request.headers).result 
		# 		render json: { error: 'Not Authorized' }, status: 401 unless @current_user 
		# 	end
		# end
# 	end
# end
