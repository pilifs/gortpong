class LiveGamesController < ApplicationController

  def index
    @live_games = LiveGame.all
    respond_to do |format|
      format.html
      format.json
    end
  end

  def show
    @live_game = LiveGame.find(params[:id])
    respond_to do |format|
      format.html
      format.json
    end
  end

  def new
    @live_game = LiveGame.new
  end

  def create
    @live_game = LiveGame.create(live_game_create_params)

    if @live_game.save
      redirect_to live_game_path(@live_game)
    else
      flash[:notice] = "Something went wrong. Please try again."
      render :new
    end
  end

  def edit
    @live_game = LiveGame.find(params[:id])
  end

  def update
    @live_game = LiveGame.find(params[:id])

    if @live_game.update_attributes(live_game_params)
      respond_to do |format|
        format.html { redirect_to live_game_path(@live_game) }
        format.js
      end
    else
      redirect_to live_game_path(@live_game)
      flash[:notice] = "Something went wrong. Please try again."
    end
  end

  def destroy
    @live_game = LiveGame.find(params[:id])
    @live_game.reset_game

    if @live_game.destroy
      redirect_to root_path
    else
      redirect_to live_game_path(@live_game)
    end
  end

  private
  def live_game_create_params
    params.require(:live_game).permit(:table_name)
  end

  def live_game_params
    params.require(:live_game).permit(:player_one_slack, :player_two_slack, :player_one_score, :player_two_score)
  end

  def start_game
    live_game.in_progress = true
  end

  def reset_game
    live_game.player_one_score = 0
    live_game.player_two_score = 0
    live_game.in_progress = false
  end

end
