class Rating < ActiveRecord::Base
  belongs_to :player

  # Cool stuff to display in player profile:
  # TODO: Average Opponent Rating
  # TODO: Average Opponent Rating when I win or lose

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

    if winner.rating.highest_ever < winner.rating.rating
      winner.rating.highest_ever = winner.rating.rating
      winner.rating.save
    end

    # if highest_ever_rating(winner)
    #   winner.rating.highest_ever = winner.rating
    #   winner.rating.save
    # end
  end

  # TODO: WHY DOESN'T THIS WORK?? ??
  # def highest_ever_rating(winner)
  #   byebug
  #   if winner.rating.rating > winner.rating.highest_ever
  #     return true
  #   else
  #     return false
  #   end
  # end

end
