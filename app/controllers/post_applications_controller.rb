class PostApplicationsController < ApplicationController
	def new
		if judge(current_user)>=3
			@post_application=PostApplication.new
		else
			redirect_to post_informations_path
		end
	end

	def create
		@post_application=PostApplication.new(post_application_params)
		@post_application.user_id=current_user.id
		if @post_application.save
				redirect_to post_applications_path
		else
			redirect_to new_post_application_path
		end
	end

# response new/editを兼ねる
	def show
		@post_application=PostApplication.find(params[:id])
		@post_application_responses=PostApplicationResponse.where(post_application_id: @post_application.id)
		# if @post_application.responded_by?(current_user)
		#    @post_application_response=current_user.post_application_responses.find_by(post_application_id: @post_application.id)
		# else
		if @post_application.responded_by?(current_user)
			@post_application_response=current_user.post_application_responses.find_by(post_application_id: @post_application.id)
			# @post_application_response=PostApplicationResponse.find_by(post_application_id: @post_application.id)
		else
			@post_application_response=PostApplicationResponse.new
		end
		# end
		@users=User.all
	end

	def index
		@post_applications=PostApplication.all
	end

	def edit
		if judge(current_user)>=3
			@post_application=PostApplication.find(params[:id])
		else
			redirect_to post_applications_path
		end
	end

	def update
		@post_application=PostApplication.find(params[:id])
		@post_application.update(post_application_params)
		redirect_to post_application_path(@post_application)
	end

	def destroy
		@post_application=PostApplication.find(params[:id])
		if judge(current_user)>=3
			@post_application.destroy
			redirect_to post_applications_path
		else
			redirect_to post_applications_path
		end
	end

	private
		def post_application_params
			 params.require(:post_application).permit(:title, :comment, :place, :date, :deadline, :target_grade, :target_home, :target_section)
		end
end
