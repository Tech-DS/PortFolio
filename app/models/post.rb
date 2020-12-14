class Post < ApplicationRecord
  belongs_to :senior
  attachment :image
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  

  def favorited_by?(senior)
    favorites.where(senior_id: senior.id).exists?
  end
end
