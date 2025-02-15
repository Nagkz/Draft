class Vlrtag < ApplicationRecord
    validates :variety, presence: true
    #Tagsテーブルから中間テーブルに対する関連付け
    has_many :player_vlrtag_relations, dependent: :destroy
    #Tagsテーブルから中間テーブルを介してArticleテーブルへの関連付け
    has_many :players, through: :player_vlrtag_relations, dependent: :destroy
end
