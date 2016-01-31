class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :at_a_glance

  def at_a_glance
    @ag_plus_minus = Player.all.order(plus_minus: :desc).limit(3)
    @ag_movers = Array.new(2) {|index| index = "coming soon"}
    @ag_toughest_opponents
    @ag_weekly_wins

  end

end
