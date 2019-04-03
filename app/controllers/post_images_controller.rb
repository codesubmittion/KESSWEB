class PostImagesController < ApplicationController
  def new
  	if judge(current_user)>=3
  		@post_image=PostImage.new
  	else
  		redirect_to post_informations_path
  	end
  end

  def edit
  	if judge(current_user)>=3
  		@post_image=PostImage.find(params[:id])
  	else
  		redirect_to post_informations_path
  	end
  end

  def create
  	@post_image=PostImage.new(post_image_params)
  	@post_image.save
  	redirect_to top_path
  end

  def update
  	@post_image=PostImage.find(params[:id])
  	@post_image.update(post_image_params)
  	redirect_to top_path
  end

  def destroy
  end

  private
    def post_image_params
			   params.require(:post_image).permit(:main_image, :sub_image)
	  end
end
