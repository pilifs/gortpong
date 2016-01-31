class Game < ActiveRecord::Base

  # This is for the key to be submitted with game form
  attr_accessor :password

  belongs_to :user
  belongs_to :winner, :class_name => 'Player', :foreign_key => 'winner_slack', :primary_key => 'slack_handle'
  belongs_to :loser, :class_name => 'Player', :foreign_key => 'loser_slack', :primary_key => 'slack_handle'

  after_initialize :set_defaults
  # before_validation :slack_to_id
  after_create :update_players

  def set_defaults
    # Sets a user ID for "submitter" key
    self.user_id ||= 1
  end


  protected
  # Commenting out to show Chris tomorrow, will remove

  # def slack_to_id
  #   byebug
  #   # Check that the slack name exists and is registered in table
  #   # Make winner_id and loser_id point to the player_id corresponding to that slack
  #   winner_id = Player.where(slack_handle: winner_id).id
  #   loser_id = self.loser(:id)
  # end

  def update_players
    score_difference = winner_score - loser_score
    Rating.update_ratings(winner, loser)
    Player.update_stats(winner, loser, score_difference)
  end


end
