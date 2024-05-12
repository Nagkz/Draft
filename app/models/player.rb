class Player < ApplicationRecord
    belongs_to :user
    has_many :likes, dependent: :destroy
    has_many :liked_users, through: :likes, source: :user

    #comment
    has_many :comments, dependent: :destroy
    has_many :commented_users, through: :players, source: :user

    #rank
    has_many :ranks, dependent: :destroy

    #tag
    has_many :player_tag_relations, dependent: :destroy
    has_many :tags, through: :player_tag_relations, dependent: :destroy

    #mptag
    has_many :player_mptag_relations, dependent: :destroy
    has_many :mptags, through: :player_mptag_relations, dependent: :destroy

    #mfctag
    has_many :player_mfctag_relations, dependent: :destroy
    has_many :mfctags, through: :player_mfctag_relations, dependent: :destroy

    #mfitag
    has_many :player_mfitag_relations, dependent: :destroy
    has_many :mfitags, through: :player_mfitag_relations, dependent: :destroy

    #mfotag
    has_many :player_mfotag_relations, dependent: :destroy
    has_many :mfotags, through: :player_mfotag_relations, dependent: :destroy

    #sptag
    has_many :player_sptag_relations, dependent: :destroy
    has_many :sptags, through: :player_sptag_relations, dependent: :destroy

    #sfctag
    has_many :player_sfctag_relations, dependent: :destroy
    has_many :sfctags, through: :player_sfctag_relations, dependent: :destroy

    #sfitag
    has_many :player_sfitag_relations, dependent: :destroy
    has_many :sfitags, through: :player_sfitag_relations, dependent: :destroy

    #sfotag
    has_many :player_sfotag_relations, dependent: :destroy
    has_many :sfotags, through: :player_sfotag_relations, dependent: :destroy

    #wptag
    has_many :player_wptag_relations, dependent: :destroy
    has_many :wptags, through: :player_wptag_relations, dependent: :destroy

    #wfctag
    has_many :player_wfctag_relations, dependent: :destroy
    has_many :wfctags, through: :player_wfctag_relations, dependent: :destroy

    #wfitag
    has_many :player_wfitag_relations, dependent: :destroy
    has_many :wfitags, through: :player_wfitag_relations, dependent: :destroy

    #wfotag
    has_many :player_wfotag_relations, dependent: :destroy
    has_many :wfotags, through: :player_wfotag_relations, dependent: :destroy

    #etag
    has_many :player_etag_relations, dependent: :destroy
    has_many :etags, through: :player_etag_relations, dependent: :destroy

    #vtag
    has_many :player_vtag_relations, dependent: :destroy
    has_many :vtags, through: :player_vtag_relations, dependent: :destroy

    #vltag
    has_many :player_vltag_relations, dependent: :destroy
    has_many :vltags, through: :player_vltag_relations, dependent: :destroy

    #vlltag
    has_many :player_vlltag_relations, dependent: :destroy
    has_many :vlltags, through: :player_vlltag_relations, dependent: :destroy

    #vutag
    has_many :player_vutag_relations, dependent: :destroy
    has_many :vutags, through: :player_vutag_relations, dependent: :destroy

    #vrtag
    has_many :player_vrtag_relations, dependent: :destroy
    has_many :vrtags, through: :player_vrtag_relations, dependent: :destroy

    #vlrtag
    has_many :player_vlrtag_relations, dependent: :destroy
    has_many :vlrtags, through: :player_vlrtag_relations, dependent: :destroy

    #otag
    has_many :player_otag_relations, dependent: :destroy
    has_many :otags, through: :player_otag_relations, dependent: :destroy

    def self.looks(search, word)
        if search == "perfect_match"
            @players = Player.where("name LIKE?", "#{word}")
            @players = Player.where("explanation LIKE?", "#{word}")
        elsif search == "partial_match"
            @players = Player.where("name LIKE?","%#{word}%")
            @players = Player.where("explanation LIKE?","%#{word}%")
        else
            @players = Player.all
        end
    end

end
