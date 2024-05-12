class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :players, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_players, through: :likes, source: :player

  has_many :comments, dependent: :destroy
  has_many :commented_players, through: :comments, source: :player
  
  has_many :favorites, dependent: :destroy
  has_many :favorited_comments, through: :favorites, source: :comment

  has_many :ranks, dependent: :destroy

  validates :name, presence: true
  validates :profile, length: { maximum: 200 } 

  has_many :requests

  def already_liked?(player)
    self.likes.exists?(player_id: player.id)
  end

  def already_favorited?(comment)
    self.favorites.exists?(comment_id: comment.id)
  end
end
