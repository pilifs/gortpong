class Player < ActiveRecord::Base
  has_many :games_won, :class_name => 'Game', :foreign_key => 'winner_slack', :primary_key => 'slack_handle'
  has_many :games_lost, :class_name => 'Game', :foreign_key => 'loser_slack', :primary_key => 'slack_handle'

  has_one :rating
  has_one :provisional_rating


  after_initialize :set_defaults

  def set_defaults
    self.wins ||= 0
    self.losses ||= 0
    self.games_played ||= 0
    self.rating ||= Rating.create(rating: 1500)
    # self.provisional_rating = ProvisionalRating.create
  end

  def self.update_ratings(winner, loser)
    current_winner_rating = winner.rating.rating
    current_loser_rating = loser.rating.rating
  end


end
