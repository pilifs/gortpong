class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :at_a_glance

  # TODO: This should show if there is a tie for 3rd place by putting (ie. Tie: 3 players) instead of showing the player with highest id in tie.
  def at_a_glance
    @ag_plus_minus = Player.all.order(plus_minus: :desc).limit(5)
    @ag_toughest_opponents #
    @ag_winning_streak = Player.all.order(win_streak: :desc).limit(5)
    @ag_avg_points = Player.all.sort_by(&:avg_points).reverse[0..4] #TODO make this a table column instead..
    @ag_win_percent = Player.all.sort_by(&:win_percentage).reverse[0..4] #TODO make this a table column instead..
    @ag_weekly_rating_gain = Array.new(2) {|index| index = "coming soon"}
  end

end
