class PlayersController < ApplicationController

  def index
    @players = Player.where("games_played > ?", 3).includes(:rating).order('ratings.rating DESC')
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

    if @player.user.authenticate(player_params[:password])
      if @player.save
        redirect_to players_path
      else
       render :new
      end
    else
      flash.now[:notice] = "Invalid submit key. If you do not know the submit key please speak to the admins."
      render :new
    end
  end

  # if @game.user.authenticate(game_params[:password])
  #   if @game.save
  #     redirect_to players_path
  #   else
  #     render :new
  #   end
  # else
  #   flash.now[:notice] = "Invalid input."
  #   render :new
  # end


  private
  def player_params
    params.require(:player).permit(:slack_handle, :display_name, :password)
  end

end
