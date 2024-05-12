class PlayerMptagRelation < ApplicationRecord
  belongs_to :player
  belongs_to :mptag
end
