class PostApplication < ApplicationRecord
	belongs_to :user
	has_many :post_application_responses, dependent: :destroy
	validates :title, :place, :date, :deadline, presence: true

	def responded_by?(user)
		post_application_responses.where(user_id: user.id).exists?
	end
end
