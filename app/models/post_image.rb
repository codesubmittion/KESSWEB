class PostImage < ApplicationRecord
	attachment :main_image
	attachment :sub_image
	validates :main_image, :sub_image, presence:true

end
