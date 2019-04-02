class PostBlog < ApplicationRecord
	attachment :image
	belongs_to :user

	validates :title, :content, presence: true
end
