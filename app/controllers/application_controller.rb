class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :at_a_glance


  # TODO: This should show if there is a tie for 3rd place by putting (Tie: 3 players) instead of player names.
  def at_a_glance
    @ag_plus_minus = Player.all.order(plus_minus: :desc).limit(3)
    @ag_toughest_opponents #
    @ag_winning_streak = Player.all.order(win_streak: :desc).limit(3)
    @ag_avg_points
    @ag_weekly_games # Games played this week
    @ag_weekly_rating_gain = Array.new(2) {|index| index = "coming soon"}
  end

end
