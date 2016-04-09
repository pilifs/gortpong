class ScoreboardController < ApplicationController
  layout 'scoreboard'
  before_action :get_scoreboard_id

  def show
  end

  def hd
    respond_to do |format|
      format.json {}
      format.html {}
    end
  end

  private
  def get_scoreboard_id
    @table = LiveGame.find(params[:live_game_id])
  end
end
