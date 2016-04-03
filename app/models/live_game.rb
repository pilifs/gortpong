class LiveGame < ActiveRecord::Base
  validates_presence_of :table_name
  validates :table_name, uniqueness: true
  # validates_presence_of :player_one_slack, :player_two_slack, :player_one_score, :player_two_score
  # validates :player_one_score, :player_two_score, numericality: true
  # validate :check_player_exists
  # validate :check_only_one_game_exists, on: [:create]

  after_initialize :set_defaults

  def set_defaults
    self.player_one_score ||= 0
    self.player_two_score ||= 0
    self.in_progress ||= false
  end

  def reset_game
    self.player_one_slack = nil
    self.player_two_slack = nil
    self.player_one_score = 0
    self.player_two_score = 0
    self.in_progress = false
    self.save
  end

  def set_status
    self.in_progress = true
    self.player_two_slack ||= "Awaiting Opponent"
    self.save
  end

  def display_name(slack_handle)
    return "Awaiting Opponent" if !slack_handle
    Player.find_by(slack_handle: slack_handle).display_name
  end

  # def check_only_one_game_exists
  #   errors.add(:base, "Only one live game can exist at a time.") if LiveGame.all.count != 0
  # end
  #
  # def check_player_exists
  #   errors.add(:base, "Players must have a valid slack handle.") unless Player.find_by(slack_handle: self.player_one_slack) && Player.find_by(slack_handle: self.player_two_slack)
  # end
end
