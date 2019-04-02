class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :post_informations, dependent: :destroy
  has_many :post_applications, dependent: :destroy
  has_many :post_application_responses, dependent: :destroy
  has_many :post_blogs, dependent: :destroy


  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :grade, presence: true
  validates :faculty, presence: true
  validates :home, presence: true
  validates :authority, presence: true
  validates :status, presence: true
  validates :char_firstname, presence: true
  validates :char_lastname, presence: true
  validates :ruby_firstname, presence: true
  validates :ruby_lastname, presence: true
  attachment :image
  # attachment :image
# 以下のmethodにより、退会者、除名者は入れません。ログインしてても追い出されます。
  def active_for_authentication?
    if super && self.status=="Seceder" || super && self.status=="Expelled"
      return false
    else
      return true
    end
  end


  def self.search(search)
    unless search
        return User.all
    else
        return User.where(['grade LIKE ? OR home LIKE ? OR authority LIKE ? OR section LIKE ? OR lastname LIKE ? OR firstname LIKE ? OR status LIKE ? OR faculty LIKE ?',"%#{search}%","%#{search}%","%#{search}%","%#{search}%","%#{search}%","%#{search}%","%#{search}%","%#{search}%"])
    end
  end

  # def inactive_message
  #   if self.status=="Seceder" || self.status=="Expelled"
  #     super: :special_condition_is_not_valid
  #   end
  # end
end
