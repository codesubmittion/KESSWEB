class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
	before_action :authenticate_user!, except: [:top, :about]
	include ApplicationHelper

	protected

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:firstname, :lastname, :home, :address, :grade, :faculty, :section, :authority, :status, :char_lastname, :char_firstname, :ruby_lastname, :ruby_firstname])
	end

	def after_sign_in_path_for(resource)
    	post_informations_path
    end

    def after_sign_out_path_for(resource)
    	root_path
    end
end
