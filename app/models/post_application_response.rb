class PostApplicationResponse < ApplicationRecord
	belongs_to :user
	belongs_to :post_application
	# if self.participation=="Partially, Yes"
	# 	validates :caption, presence:true
	# elsif self.participation=="No"
	# 	validates :reason, presence:true
	# end
end
