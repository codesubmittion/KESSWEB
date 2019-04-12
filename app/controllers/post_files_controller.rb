class PostFilesController < ApplicationController
	def new
		if judge(current_user)>=3
			@post_file=PostFile.new
		else
			redirect_to informations_path
		end
	end

	def create
		@post_file=PostFile.new(post_file_params)
		@post_file.user_id=current_user.id
		if @post_file.save
			redirect_to post_files_path
		else
		    render :new
		end
	end


	def edit
	end

	def update
	end

	def destroy
		post_file=PostFile.find(params[:id])
		post_file.destroy
		redirect_to post_files_path
	end

	def index
		@post_files=PostFile.all
	end

	# def download
	# 	post_file=PostFile.find(params[:id])
	# 	post_file.download
	# 	redirect_to post_files_path
	# end

	private

	def post_file_params
		 params.require(:post_file).permit(:title, :caption, :file, :target_grade,:target_home,:target_section,:target_authority)
	end

end
