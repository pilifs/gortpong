class PlayersController < ApplicationController

  def index
    @players = Player.all.order(wins: :desc)
    @games = Game.all.order(created_at: :desc).limit(10)
  end
end
