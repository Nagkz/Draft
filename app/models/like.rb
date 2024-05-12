class Like < ApplicationRecord
  belongs_to :player
  belongs_to :user

  validates_uniqueness_of :player_id, scope: :user_id
end
