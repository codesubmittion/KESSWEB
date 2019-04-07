class PostBlogsController < ApplicationController
	def new
		if judge(current_user)>=3
			@post_blog=PostBlog.new
		else
			redirect_to post_informations_path
		end
	end

	# def index
	# 	@post_blogs=PostBlog.all
	# end

# renderじゃないと情報が保存されず、errorメッセージがでない。
# renderの場合は、必要な他の変数もviewで渡すように注意
	def create
		@post_blog=PostBlog.new(post_blog_params)
		@post_blog.user_id=current_user.id
		if @post_blog.save
		# 変更の可能性あり
			redirect_to root_post_blogs_path
		else
			render :new
		end
	end

	def edit
		if judge(current_user)>=3
			@post_blog=PostBlog.find(params[:id])
		else
			redirect_to root_post_blogs_path
		end
	end

	def update
		@post_blog=PostBlog.find(params[:id])
		if @post_blog.update(post_blog_params)
			redirect_to root_post_blogs_path
		else
			render :edit
		end
	end

	# def show
	# 	@post_blog=PostBlog.find(params[:id])
	# end

	def destroy
		# 条件追記
		@post_blog=PostBlog.find(params[:id])
		if judge(current_user)>=3
			@post_blog.destroy
			redirect_to root_post_blogs_path
		else
			redirect_to root_post_blogs_path
		end
	end

	private

	def post_blog_params
		 params.require(:post_blog).permit(:title, :content, :image, :category)
	end
end
