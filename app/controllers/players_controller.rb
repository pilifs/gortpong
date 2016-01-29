class PlayersController < ApplicationController

  def index
    @players = Player.includes(:rating).order('ratings.rating DESC')
    @games = Game.all.order(created_at: :desc).limit(10)
  end
end
