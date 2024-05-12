class PlayerWptagRelation < ApplicationRecord
  belongs_to :player
  belongs_to :wptag
end
