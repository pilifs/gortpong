class GamesController < ApplicationController

  def index
    @games = Game.all.order(created_at: :desc)
  end

  def new
    @game = Game.new
  end

  def show
    @game = Game.find(params[:id])
  end

  def create
    #TODO Ensure winner != loser
    #TODO Ensure winner and loser slack handles both exist
    #TODO Ensure winner score > loser score
    #TODO Ensure winner score >= 21

    @game = Game.new(game_params)
    if @game.user.authenticate(game_params[:password])
      if @game.save
        redirect_to players_path
      else
        render :new
      end
    else
      flash.now[:notice] = "Invalid submit key. If you do not know the submit key please speak to the admins."
      render :new
    end
  end

  private
  def game_params
    params.require(:game).permit(:winner_slack, :winner_score, :loser_slack, :loser_score, :password, :video_link)
  end

end
