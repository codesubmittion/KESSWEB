class PostApplicationResponse < ApplicationRecord
	belongs_to :user
	belongs_to :post_application
	validates :participation, presence:true
	validates :caption, presence:true, :if => Proc.new {self.participation == "△"}
	validates :reason, presence:true, :if => Proc.new {self.participation == "✕"}
end
