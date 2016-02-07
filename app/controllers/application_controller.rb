class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :at_a_glance

  # TODO: This should show if there is a tie for 3rd place by putting (ie. Tie: 3 players) instead of showing the player with highest id in tie.
  # TODO: The sort queries should probably be a seperate column for performance reasons?
  def at_a_glance
    @ag_plus_minus = Player.all.order(plus_minus: :desc).limit(5)
    @ag_toughest_opponents = Player.includes(:rating).order("ratings.avg_opp_rating DESC").limit(5)
    @ag_winning_streak = Player.all.order(win_streak: :desc).limit(5)
    @ag_avg_points = Player.where('games_played >= ?', 3).sort_by(&:avg_points).reverse[0..4] #TODO make this a table column instead..
    @ag_win_percent = Player.where('games_played >= ?', 3).sort_by(&:win_percentage).reverse[0..4] #TODO make this a table column instead..
    @ag_highest_ever_rating = Player.includes(:rating).order("ratings.highest_ever DESC").limit(5)
  end

end
