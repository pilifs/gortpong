class GamesController < ApplicationController

  def index
    @games = Game.all
  end

  def new
    @game = Game.new
  end

  def create
    #TODO Ensure winner != loser
    #TODO Ensure winner and loser slack handles both exist
    #TODO Ensure winner score > loser score
    #TODO Ensure winner score >= 21
  
    @game = Game.new(game_params)

    if @game.save
      redirect_to players_path
    else
      render :new
    end
  end

  private

  def game_params
    params.require(:game).permit(:winner_slack, :winner_score, :loser_slack, :loser_score)
  end


end
