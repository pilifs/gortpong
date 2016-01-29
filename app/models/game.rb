class Game < ActiveRecord::Base
  belongs_to :winner, :class_name => 'Player', :foreign_key => 'winner_slack', :primary_key => 'slack_handle'
  belongs_to :loser, :class_name => 'Player', :foreign_key => 'loser_slack', :primary_key => 'slack_handle'

  # before_validation :slack_to_id
  after_create :update_players

  protected
  # Commenting out to show Chris tomorrow, will remove

  # def slack_to_id
  #   byebug
  #   # Check that the slack name exists and is registered in table
  #   # Make winner_id and loser_id point to the player_id corresponding to that slack
  #   winner_id = Player.where(slack_handle: winner_id)
  #   loser_id = self.loser(:id)
  # end

  def update_players
    self.winner.increment!(:wins)
    self.winner.increment!(:games_played)
    self.loser.increment!(:losses)
    self.loser.increment!(:games_played)
    Rating.update_ratings(winner, loser)
  end


end
