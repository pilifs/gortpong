class LiveGamesController < ApplicationController
  layout 'live'

  def index
    @live_games = LiveGame.all.order(:created_at)
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
    # TODO: Logic needs to move from edit view to here
  end

  def update
    # TODO: More param submission validations. IE: Default to player_one if no one on table, do not allow people to overwrite participants
    @live_game = LiveGame.find(params[:id])

    if @live_game.update_attributes(live_game_params)
      @live_game.in_progress = true # This is confusing but it's okay for now. Should not need to be set when score updates only when players join
      @live_game.save
      respond_to do |format|
        format.html { redirect_to live_game_path(@live_game) }
        format.js
      end
    else
      redirect_to edit_live_game_path(@live_game)
      flash[:notice] = "Something went wrong. Please try again."
    end
  end

  def destroy
    @live_game = LiveGame.find(params[:id])
    @live_game.reset_game
    # NOTE: Add notice and check here
    redirect_to live_games_path
  end

  private
  def live_game_create_params
    params.require(:live_game).permit(:table_name)
  end

  def live_game_params
    params.require(:live_game).permit(:player_one_slack, :player_two_slack, :player_one_score, :player_two_score)
  end

  def start_game
    # TODO: Add game start time. Add warmup and true in progress so we know when the game starts and can track game length.
    live_game.in_progress = true
  end


end
