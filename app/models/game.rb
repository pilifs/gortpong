class Game < ActiveRecord::Base

  # This is for the key to be submitted with game form
  attr_accessor :password

  belongs_to :user
  # TODO: This needs to be refactored to use ID as keys, not the slack string, for db performance. Next thing we will do.
  # TODO: Also need to add the keys to database for performance.
  belongs_to :winner, :class_name => 'Player', :foreign_key => 'winner_slack', :primary_key => 'slack_handle'
  belongs_to :loser, :class_name => 'Player', :foreign_key => 'loser_slack', :primary_key => 'slack_handle'

  after_initialize :set_defaults
  after_create :update_players

  validates :winner_score, :loser_score, :winner_slack, :loser_slack, presence: true
  validates :winner_score, numericality: { greater_than_or_equal_to: 21 }
  validates :winner_score, numericality: { greater_than: :loser_score }
  validates :loser_score, numericality: { greater_than_or_equal_to: 0 }

  validates :winner_slack,
            :presence => true,
            :inclusion => { :in => proc { Player.pluck(:slack_handle) } }

  validates :loser_slack,
            :presence => true,
            :inclusion => { :in => proc { Player.pluck(:slack_handle) } }


  def set_defaults
    # Sets a user ID for "submitter" key
    self.user_id ||= 1
  end

  # NOTE: This should not be called from the callback. We should put it in the controller to happen on request or in another method called by callback for testing purposes, but then how do we test data (ie. our own not submitted)??
  def update_players
    score_difference = winner_score - loser_score
    self.rating_change = Rating.update_ratings(winner, loser) # Returns rating change
    self.save
    Player.update_stats(winner, loser, score_difference)
  end

end
