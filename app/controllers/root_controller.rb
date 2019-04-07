class RootController < ApplicationController

	def top
		# あたらしいものから
		@post_blogs=PostBlog.all.reverse_order
		if image_posted?
			@post_image=PostImage.last
		end
		@users=User.where(status: ["Regular", "Associate"])
	end

	def contact
		@inquiry=Inquiry.new
	end

	def about
	end
	# post_blog用
	def root_show
		@post_blog=PostBlog.find(params[:id])
		@post_blogs=PostBlog.all.reverse_order
	end

	def root_index
		@post_blogs=PostBlog.search(params[:search]).page(params[:page]).reverse_order
	end
end
