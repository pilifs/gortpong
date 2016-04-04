class PlayerQueue < ActiveRecord::Base
  belongs_to :live_game

  validate :verify_uniqueness_of_queue

  def verify_uniqueness_of_queue
    unless self.player_id == self.player_id.uniq
      errors.add(:base, "You cannot join a queue multiple times.")
    end
  end

end
