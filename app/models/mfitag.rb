class Mfitag < ApplicationRecord
    validates :main_fi_position, presence: true
    #Tagsテーブルから中間テーブルに対する関連付け
    has_many :player_mfitag_relations, dependent: :destroy
    #Tagsテーブルから中間テーブルを介してArticleテーブルへの関連付け
    has_many :players, through: :player_mfitag_relations, dependent: :destroy
end
