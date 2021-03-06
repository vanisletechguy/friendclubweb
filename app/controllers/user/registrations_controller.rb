class User::RegistrationsController < Devise::RegistrationsController
	before_action :configure_permitted_parameters

	protected

	#def configure_permitted_parameters
	#	devise_parameter_sanitizer.for(:sign_up).push(:first_name, :last_name)
	#	devise_parameter_sanitizer.for(:account_update).push(:first_name, :last_name)
	#end

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :avatar])
		devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :avatar])
	end
end