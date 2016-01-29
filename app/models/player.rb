class Player < ActiveRecord::Base
  has_many :games_won, :class_name => 'Game', :foreign_key => 'winner_slack', :primary_key => 'slack_handle'
  has_many :games_lost, :class_name => 'Game', :foreign_key => 'loser_slack', :primary_key => 'slack_handle'


  after_initialize :set_defaults

  def set_defaults
    self.wins ||= 0
    self.losses ||= 0
    self.games_played ||= 0
  end

end
