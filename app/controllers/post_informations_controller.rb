class PostInformationsController < ApplicationController
	def new
		if judge(current_user)>=2
			@post_information=PostInformation.new
		else
			redirect_to post_informations_path
		end
	end
	def edit
		if judge(current_user)>=2
			@post_information=PostInformation.find(params[:id])
		else
			redirect_to post_informations_path
		end
	end
	def create
		@post_information=PostInformation.new(post_information_params)
		@post_information.user_id=current_user.id
		if @post_information.save
			redirect_to post_informations_path
		else
			render :new
		end
	end

	def index
		@post_informations=PostInformation.all
	end

	def show
		@post_information=PostInformation.find(params[:id])
	end

	def destroy
		@post_information=PostInformation.find(params[:id])
		# 権限を追記
		if judge(current_user)>=2
			@post_information.destroy
			redirect_to post_informations_path
		else
			redirect_to post_informations_path
		end
	end

	private
		def post_information_params
			params.require(:post_information).permit(:title, :comment, :place, :date, :image)
		end

end
