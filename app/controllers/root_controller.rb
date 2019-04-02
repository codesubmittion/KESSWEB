class RootController < ApplicationController

	def top
		@post_blogs=PostBlog.all
		if image_posted?
			@post_image=PostImage.last
		end
	end

	def about
	end
end
