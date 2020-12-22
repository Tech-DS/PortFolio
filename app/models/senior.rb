class Senior < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attachment :profile_image
  has_many :posts, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :timelines, dependent: :destroy
  has_many :follow_requests, dependent: :destroy
  has_many :junior_follows, dependent: :destroy
  has_many :events, dependent: :destroy
  def self.search(search)
    Senior.where(email: "#{search}")
  end
end