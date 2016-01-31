class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :at_a_glance

  def at_a_glance
    @plus_minus = Player.all.order(plus_minus: :desc).limit(3)
  end

end
