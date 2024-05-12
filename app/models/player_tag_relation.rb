class PlayerTagRelation < ApplicationRecord
  belongs_to :player
  belongs_to :tag
end
