class PostComment < ApplicationRecord
  belongs_to :senior
  belongs_to :junior, optional: true
  belongs_to :post
end
