class Otag < ApplicationRecord
    validates :original, presence: true
    has_many :player_otag_relations, dependent: :destroy
    #Tagsテーブルから中間テーブルを介してArticleテーブルへの関連付け
    has_many :players, through: :player_otag_relations, dependent: :destroy
end
