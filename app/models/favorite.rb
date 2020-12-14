class Favorite < ApplicationRecord
  belongs_to :junior, optional: true
  belongs_to :senior, optional: true
  belongs_to :post
end
