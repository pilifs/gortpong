class Player < ActiveRecord::Base

  # This is for the key to be submitted with player create form
  attr_accessor :password

  belongs_to :user
  # TODO: This needs to be refactored to use ID as keys, not the slack string, for db performance. Next thing we will do.
  # TODO: Also need to index the database for performance.
  has_many :games_won, :class_name => 'Game', :foreign_key => 'winner_slack', :primary_key => 'slack_handle'
  has_many :games_lost, :class_name => 'Game', :foreign_key => 'loser_slack', :primary_key => 'slack_handle'

  has_one :rating
  has_one :provisional_rating

  after_initialize :set_defaults

  validates :slack_handle, :display_name, presence: true
  validates :slack_handle, uniqueness: true
  validates :display_name, uniqueness: true
  validates :display_name, length: { maximum: 12 }

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

  def win_percentage
    return 'n/a' if games_played == 0
    0 if games_won.count == 0
    100 if games_lost.count == 0
    ((games_won.count.to_f / games_played) * 100).round(2)
  end

  # These two methods could potentially be private. Will hold off on that, may call them somewhere else
  def avg_points
    (total_points.to_f / games_played.to_f).round(2)
  end

  def total_points
    games_won.sum(:winner_score) + games_lost.sum(:loser_score)
  end

end
