class Rating < ActiveRecord::Base
  belongs_to :player
  after_initialize :set_defaults

  def set_defaults
    rating ||= 1500
  end

  def self.update_ratings(winner, loser)
    current_ratings = {winner: winner.rating.rating, loser: loser.rating.rating}

    transformed_winner_rating = 10**(current_ratings[:winner] / 400.to_f)
    transformed_loser_rating = 10**(current_ratings[:loser] / 400.to_f)

    expected_winner_score = transformed_winner_rating / (transformed_winner_rating + transformed_loser_rating)

    # Positive value
    rating_difference = (32 * (1 - expected_winner_score)).to_i

    winner.rating.rating = current_ratings[:winner] + rating_difference
    loser.rating.rating = current_ratings[:loser] - rating_difference

    winner.rating.save
    loser.rating.save

  end

end
