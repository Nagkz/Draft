class FavoritesController < ApplicationController

    def create
      favorite = current_user.favorites.create(comment_id: params[:comment_id]) #user_idとtweet_idの二つを代入
      redirect_back(fallback_location: root_path)
    end
  
    def destroy
      favorite = Favorite.find_by(comment_id: params[:comment_id], user_id: current_user.id)
      favorite.destroy
      redirect_back(fallback_location: root_path)
    end
  
end