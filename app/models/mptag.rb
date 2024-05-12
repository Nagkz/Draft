class Mptag < ApplicationRecord
    validates :main_p_position, presence: true
    #Tagsテーブルから中間テーブルに対する関連付け
    has_many :player_mptag_relations, dependent: :destroy
    #Tagsテーブルから中間テーブルを介してArticleテーブルへの関連付け
    has_many :players, through: :player_mptag_relations, dependent: :destroy
end
