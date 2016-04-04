class PlayerQueuesController < ApplicationController

  def update
    @queue = PlayerQueue.find(params[:id])
  end

  private
  def player_queue_params
    params.require(:player_queue).permit(:player_id)
  end
end
