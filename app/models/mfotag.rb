class Mfotag < ApplicationRecord
    validates :main_fo_position, presence: true
    #Tagsテーブルから中間テーブルに対する関連付け
    has_many :player_mfotag_relations, dependent: :destroy
    #Tagsテーブルから中間テーブルを介してArticleテーブルへの関連付け
    has_many :players, through: :player_mfotag_relations, dependent: :destroy
end
