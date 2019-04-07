class PostApplicationResponsesController < ApplicationController
	def create
		@post_application=PostApplication.find(params[:post_application_id])
		@post_application_response=current_user.post_application_responses.new(post_application_response_params)
		@post_application_response.post_application_id=@post_application.id
		if @post_application_response.save
			redirect_to post_applications_path
		else
			# renderで呼び出すviewだけ指定
			@post_application_responses=PostApplicationResponse.where(post_application_id: @post_application.id)
			@users=User.all
			render 'post_applications/show'
		end
	end

	# def index
	# 	@post_application=PostApplication.find(params[:post_application_id])
	# 	@post_application_response
	# end
	# def new
	# 	@post_application_response=PostApplicationResponse.new
	# 	@post_application=PostApplication.find(params[:post_application_id])
	# end

	# def edit
	# 	@post_application_resopnse=PostApplicationResponse.find(params[:id])
	# end

	def update
		@post_application=PostApplication.find(params[:post_application_id])
		@post_application_response=current_user.post_application_responses.find_by(post_application_id: @post_application.id)
		if @post_application_response.update(post_application_response_params)
			redirect_to post_applications_path
		else
			@post_application_responses=PostApplicationResponse.where(post_application_id: @post_application.id)
			@users=User.all
			render 'post_applications/show'
		end
	end

	# def destroy
	# 	@post_application_response=PostApplicationResponse.find(params[:id])
	# 	@post_application_response.destroy
	# 	redirect_to post_applications_path
	# end

	private
		def post_application_response_params
  			params.require(:post_application_response).permit(:user_id,
                      :post_application_id,:reason,:caption,:participation)
		end
end
