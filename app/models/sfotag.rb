class Sfotag < ApplicationRecord
    validates :sub_fo_position, presence: true
    #Tagsテーブルから中間テーブルに対する関連付け
    has_many :player_sfotag_relations, dependent: :destroy
    #Tagsテーブルから中間テーブルを介してArticleテーブルへの関連付け
    has_many :players, through: :player_sfotag_relations, dependent: :destroy
end
