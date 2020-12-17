class PostComment < ApplicationRecord
  belongs_to :senior, optional: true
  belongs_to :junior, optional: true
  belongs_to :post
end
