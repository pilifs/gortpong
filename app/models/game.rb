class Game < ActiveRecord::Base
  belongs_to :winner, :class_name => 'Player', :foreign_key => 'winner_id'
  belongs_to :loser, :class_name => 'Player', :foreign_key => 'loser_id'

  after_create :update_players

  protected
  def update_players
    self.winner.increment_wins
    self.loser.increment_losses
  end

end
