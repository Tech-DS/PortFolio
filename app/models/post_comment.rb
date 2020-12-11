class PostComment < ApplicationRecord
  belongs_to :senior
  belongs_to :junior
  belongs_to :post
end
