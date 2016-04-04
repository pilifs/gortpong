class PlayerQueuesController < ApplicationController

  def update
    @queue = PlayerQueue.find(params[:id])
    @player = Player.find_by(slack_handle: params[:player_queue][:player_id])

    @queue.player_id << @player.id
    if @queue.save
      flash[:notice] = "You've joined the queue!"
    else
      redirect_to live_game_path(@queue.live_game)
      flash[:notice]
    end
  end

  def destroy
    @queue = PlayerQueue.find(params[:id])

    @queue.player_id.delete(params[:player_id].to_i)
    @queue.save
  end

  private
  def player_queue_params
    params.require(:player_queue).permit(:player_id)
  end
end
