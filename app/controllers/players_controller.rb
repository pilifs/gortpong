class PlayersController < ApplicationController

  def index
    @players = Player.all.order(wins: :desc)
  end
end
