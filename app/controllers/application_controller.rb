class ApplicationController < ActionController::Base

# Author:Kazuya Fujita, 2019/04/06
	before_action :configure_permitted_parameters, if: :devise_controller?
	# inquiryのためにcreateをokにしているが、本来はよくないと思う。
	before_action :authenticate_user!, except: [:top, :about, :contact, :root_show, :root_index, :create]

	include ApplicationHelper


	def inquirys_controller?
		false
	end

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
