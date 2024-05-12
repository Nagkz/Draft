class PlayerEtagRelation < ApplicationRecord
  belongs_to :player
  belongs_to :etag
end
