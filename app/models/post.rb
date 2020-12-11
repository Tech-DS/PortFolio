class Post < ApplicationRecord
  belongs_to :senior
  attachment :image
end
