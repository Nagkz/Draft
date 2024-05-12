class Wptag < ApplicationRecord
    validates :whole_p_position, presence: true
    #Tagsテーブルから中間テーブルに対する関連付け
    has_many :player_wptag_relations, dependent: :destroy
    #Tagsテーブルから中間テーブルを介してArticleテーブルへの関連付け
    has_many :players, through: :player_wptag_relations, dependent: :destroy
end
