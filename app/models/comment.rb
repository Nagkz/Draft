class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :player

  has_many :favorites, dependent: :destroy
  has_many :favorited_users, through: :favorites, source: :user
end
