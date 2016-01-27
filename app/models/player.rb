class Player < ActiveRecord::Base
  has_many :games_won, :class_name => 'Game', :foreign_key => 'winner_id'
  has_many :games_lost, :class_name => 'Game', :foreign_key => 'loser_id'

  after_initialize :set_defaults

  def set_defaults
    self.wins = 0
    self.losses = 0
    self.games_played = 0
  end

  def increment_wins
    self.wins += 1
    self.games_played += 1
  end

  def increment_losses
    self.losses += 1
    self.games_played += 1
  end

end
