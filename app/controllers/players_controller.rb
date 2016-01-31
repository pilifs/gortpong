class PlayersController < ApplicationController

  def index
    @players = Player.includes(:rating).order('ratings.rating DESC')
    @games = Game.all.order(created_at: :desc).limit(@players.count)
  end

  def show
    @player = Player.find(params[:id])
  end

  def new
    @player = Player.new
  end

  def create
    @player = Player.new(player_params)

    if @player.save
      redirect_to @player
    else
      render :new
    end
  end


  protected
  def player_params
    params.require(:player).permit(:slack_handle, :display_name)
  end

end
