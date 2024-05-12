class Wfitag < ApplicationRecord
    validates :whole_fi_position, presence: true
    #Tagsテーブルから中間テーブルに対する関連付け
    has_many :player_wfitag_relations, dependent: :destroy
    #Tagsテーブルから中間テーブルを介してArticleテーブルへの関連付け
    has_many :players, through: :player_wfitag_relations, dependent: :destroy
end
