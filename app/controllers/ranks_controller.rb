class RanksController < ApplicationController
  before_action :authenticate_user!

    def create
        player = Player.find(params[:player_id])
        rank = player.ranks.build(rank_params) #buildを使い、contentとtweet_idの二つを同時に代入
        rank.user_id = current_user.id
        if rank.save
            flash[:success] = "コメントしました"
            redirect_back(fallback_location: root_path) #直前のページにリダイレクト
        else
            flash[:success] = "コメントできませんでした"
            redirect_back(fallback_location: root_path) #直前のページにリダイレクト
        end
    end

  private
    def rank_params
      params.require(:rank).permit(:body)
    end
end
