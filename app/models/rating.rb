class Rating < ActiveRecord::Base
  belongs_to :player

  # NOTE: Should be called rating.elo not rating.rating. Or class should be called Elo for associations?

  # This constant dictates how much the rating can change.
  # It always multiplies the expected probability by this to determine rating change
  # IE: 50/50 is + or - 16. The most rating you can gain or lose from one game is 32.
  @@K_FACTOR = 32

  # TODO: This method is doing way too much. Will refactor soon with tests
  def self.update_ratings(winner, loser)
    current_ratings = {winner: winner.rating.rating, loser: loser.rating.rating}

    # Average opponent ratings
    winner.rating.calculate_avg_opp_rating_win(winner, current_ratings[:loser])
    loser.rating.calculate_avg_opp_rating_loss(loser, current_ratings[:winner])

    # Transformed rating to get ELO probablity
    transformed_winner_rating = 10**(current_ratings[:winner] / 400.to_f)
    transformed_loser_rating = 10**(current_ratings[:loser] / 400.to_f)

    # Expected chance to win from ELO formula
    expected_winner_score = transformed_winner_rating / (transformed_winner_rating + transformed_loser_rating)

    # Positive value based on win probability - winner will go up by this amt and loser will go down by it
    rating_difference = (@@K_FACTOR * (1 - expected_winner_score)).to_i

    winner.rating.rating = current_ratings[:winner] + rating_difference
    loser.rating.rating = current_ratings[:loser] - rating_difference

    winner.rating.save
    loser.rating.save

    # Store the new rating if that is the winner's highest ever. This should probably be a seperate method.
    if winner.rating.highest_ever < winner.rating.rating
      winner.rating.highest_ever = winner.rating.rating
      winner.rating.save
    end

    # Return this value so that when a game calls this, it can set the rating_change
    # attribute at the same time.
    rating_difference
  end

  # TODO: DRY refactor... badly. This will be fixed soon. Just wanted to get it working for at a glance stats asap.
  def calculate_avg_opp_rating_win(winning_player, loser_rating)
    #Calculate average opponent rating for wins
    if winning_player.rating.avg_opp_rating_win == nil
      winning_player.rating.avg_opp_rating_win = loser_rating
      winning_player.rating.save
    else
      current_average = winning_player.rating.avg_opp_rating_win
      games_played = winning_player.games_played - 1
      total = current_average * games_played + loser_rating
      winning_player.rating.avg_opp_rating_win = total / (games_played + 1)
      winning_player.rating.save
    end

    #Calculate average opponent rating (overall)
    if winning_player.rating.avg_opp_rating == nil
      winning_player.rating.avg_opp_rating = loser_rating
      winning_player.rating.save
    else
      current_average = winning_player.rating.avg_opp_rating
      games_played = winning_player.games_played - 1
      total = current_average * games_played + loser_rating
      winning_player.rating.avg_opp_rating = total / (games_played + 1)
      winning_player.rating.save
    end

  end

  def calculate_avg_opp_rating_loss(losing_player, winner_rating)
    #Calculate average opponent rating for losses
    if losing_player.rating.avg_opp_rating_loss == nil
      losing_player.rating.avg_opp_rating_loss = winner_rating
      losing_player.rating.save
    else
      current_average = losing_player.rating.avg_opp_rating_loss
      games_played = losing_player.games_played - 1
      total = current_average * games_played + winner_rating
      losing_player.rating.avg_opp_rating_loss = total / (games_played + 1)
      losing_player.rating.save
    end

    #Calculate average opponent rating (overall)
    if losing_player.rating.avg_opp_rating == nil
      losing_player.rating.avg_opp_rating = winner_rating
      losing_player.rating.save
    else
      current_average = losing_player.rating.avg_opp_rating
      games_played = losing_player.games_played - 1
      total = current_average * games_played + winner_rating
      losing_player.rating.avg_opp_rating = total / (games_played + 1)
      losing_player.rating.save
    end

  end

end
