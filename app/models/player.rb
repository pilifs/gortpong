class Player < ActiveRecord::Base

  # This is for the key to be submitted with game form
  attr_accessor :password

  belongs_to :user
  has_many :games_won, :class_name => 'Game', :foreign_key => 'winner_slack', :primary_key => 'slack_handle'
  has_many :games_lost, :class_name => 'Game', :foreign_key => 'loser_slack', :primary_key => 'slack_handle'

  has_one :rating
  has_one :provisional_rating

  after_initialize :set_defaults

  def set_defaults
    self.user_id ||= 1
    self.wins ||= 0
    self.losses ||= 0
    self.games_played ||= 0
    self.win_streak ||= 0
    self.plus_minus ||= 0
    self.rating ||= Rating.create(rating: 1500, highest_ever: 1500)
    # self.provisional_rating = ProvisionalRating.create
  end

  def self.update_stats(winner, loser, score_difference)

    winner.increment!(:wins)
    winner.increment!(:games_played)

    loser.increment!(:losses)
    loser.increment!(:games_played)

    winner.increment!(:win_streak)
    loser.win_streak = 0

    winner.plus_minus += score_difference
    loser.plus_minus = loser.plus_minus - score_difference

    winner.save
    loser.save
  end

end
