class Post < ApplicationRecord
  belongs_to :senior
  attachment :image
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy


  def favorited_by?(junior)
    favorites.where(junior_id: junior.id).exists?
  end
end


