class Etag < ApplicationRecord
    validates :expectation, presence: true
    #Tagsテーブルから中間テーブルに対する関連付け
    has_many :player_etag_relations, dependent: :destroy
    #Tagsテーブルから中間テーブルを介してArticleテーブルへの関連付け
    has_many :players, through: :player_etag_relations, dependent: :destroy
end
