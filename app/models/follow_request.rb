class FollowRequest < ApplicationRecord
  belongs_to :senior
  belongs_to :junior
end
