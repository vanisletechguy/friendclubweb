module Api
  module V1
    class ApplicationController < ApplicationController
      skip_before_action :verify_authenticity_token
      acts_as_token_authentication_handler_for User
      include DeviseTokenAuth::Concerns::SetUserByToken

		attr_reader :current_user 

			private 

			def authenticate_request 
				@current_user = AuthorizeApiRequest.call(request.headers).result 
				render json: { error: 'Not Authorized' }, status: 401 unless @current_user 
			end


    end
  end
end
