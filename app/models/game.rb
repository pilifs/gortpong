class Game < ActiveRecord::Base
  belongs_to :winner, :class_name => 'Player', :foreign_key => 'winner_id'
  belongs_to :loser, :class_name => 'Player', :foreign_key => 'loser_id'

  after_save :update_players

  protected
  def update_players
    # byebug
    self.winner.increment_wins
    # byebug
    # self.winner.save!
    # byebug
    self.loser.increment_losses
    # byebug
    # self.loser.save!
    # byebug
  end

end
