class SearchesController < ApplicationController
    before_action :authenticate_user!

    def search
      @range = params[:range]
  
      if @range == "Name"
        @players = Player.looks(params[:search], params[:word])
      elsif @range == "Explanation"
        @players = Player.looks(params[:search], params[:word])
      end
    end
end
