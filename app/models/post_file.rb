class PostFile < ApplicationRecord
	attachment :file
	belongs_to :user
	validates :file, presence:true

	 def file_extension
   		 File.extname(file_filename) if file_filename
 	 end
	# def file_extension
 #  		self.file_content_type.split('.').last
	# end
end
