class PostBlogsController < ApplicationController
	def new
		if judge(current_user)>=3
			@post_blog=PostBlog.new
		else
			redirect_to post_informations_path
		end
	end

	def create
		@post_blog=PostBlog.new(post_blog_params)
		@post_blog.user_id=current_user.id
		@post_blog.save
		# 変更の可能性あり
		redirect_to top_path
	end

	def show
		@post_blog=PostBlog.find(params[:id])
	end

	def destroy
		# 条件追記
		@post_blog=PostBlog.find(params[:id])
		if judge(current_user)>=3
			@post_blog.destroy
			redirect_to top_path
		else
			redirect_to top_path
		end
	end

	private

	def post_blog_params
		 params.require(:post_blog).permit(:title, :content, :image, :category)
	end
end
