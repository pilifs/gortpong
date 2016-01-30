class Game < ActiveRecord::Base

  attr_accessor :password

  belongs_to :user
  belongs_to :winner, :class_name => 'Player', :foreign_key => 'winner_slack', :primary_key => 'slack_handle'
  belongs_to :loser, :class_name => 'Player', :foreign_key => 'loser_slack', :primary_key => 'slack_handle'

  accepts_nested_attributes_for :user

  after_initialize :set_defaults
  # before_validation :slack_to_id
  after_create :update_players

  def set_defaults
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
    self.winner.increment!(:wins)
    self.winner.increment!(:games_played)
    self.loser.increment!(:losses)
    self.loser.increment!(:games_played)
    Rating.update_ratings(winner, loser)
  end


end
