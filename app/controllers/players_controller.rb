class PlayersController < ApplicationController

  def index
    @players = Player.includes(:rating).order('ratings.rating DESC')
    @games = Game.all.order(created_at: :desc).limit(10)
  end

  def show
    @player = Player.find(params[:id])
  end
end
