class Junior < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :post_comments, dependent: :destroy
  has_many :follow_requests, dependent: :destroy
  has_many :junior_follows, dependent: :destroy
  has_many :follow_seniors, through: :junior_follows, source: :senior
  has_many :follow_requests

  def already_requested?(senior)
    self.follow_requests.exists?(senior_id: senior.id)
  end

  def already_followed?(senior)
   self.junior_follows.exists?(senior_id: senior.id)
  end
end
