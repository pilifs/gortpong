class LiveGamesController < ApplicationController

  def new
    @live_game = LiveGame.new
  end

  def create
    @live_game = LiveGame.create(live_game_params)
    @live_game.player_one_score = 0
    @live_game.player_two_score = 0

    if @live_game.save
      redirect_to live_game_path(@live_game)
    else
      flash[:notice] = "Something went wrong. Please try again."
      render :new
    end
  end

  def show
    @live_game = LiveGame.find(params[:id])
    @player_one_slack = @live_game.player_one_slack
    @player_two_slack = @live_game.player_two_slack
    @player_one_score = @live_game.player_one_score
    @player_two_score = @live_game.player_two_score
  end

  private
  def live_game_params
    params.require(:live_game).permit(:player_one_slack, :player_two_slack, :player_one_score, :player_two_score)
  end

end
