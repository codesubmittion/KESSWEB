class PostBlog < ApplicationRecord
	attachment :image
	belongs_to :user

	validates :title, :content, :image, presence: true


	def self.search(search)
    unless search
        return PostBlog.all
    else
        return PostBlog.where(['title LIKE ? OR content LIKE ? OR category LIKE ?',"%#{search}%","%#{search}%","%#{search}%"])
    end
  end

end
