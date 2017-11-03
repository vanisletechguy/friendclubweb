module Api
  module V1
    class ApplicationController < ActionController::Base
      #skip_before_action :verify_authenticity_token
      #acts_as_token_authentication_handler_for User
      #include DeviseTokenAuth::Concerns::SetUserByToken

      before_action :authenticate_request

		attr_reader :current_user 

			private 

			def authenticate_request 
				@current_user = AuthorizeApiRequest.call(request.headers).result 
				render json: { error: 'Not Authorized' }, status: 401 unless @current_user 
			end

    end
  end
end


#eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyLCJleHAiOjE1MDk3NjM3NDd9.zB4C7zHSd_MG-uCq7qPvXUx6sZM3eAV0QuQdZj3g4I8
# curl -H "Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyLCJleHAiOjE1MDk3NjM3NDd9.zB4C7zHSd_MG-uCq7qPvXUx6sZM3eAV0QuQdZj3g4I8" http://localhost:3000/api/v1/my_friends


#curl -H "Content-Type: application/json" -X POST -d '{"email":"test1@test.com","password":"abcdef"}' http://localhost:3000/authenticate