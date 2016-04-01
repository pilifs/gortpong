class LiveGame < ActiveRecord::Base
  validates_presence_of :player_one_slack, :player_two_slack, :player_one_score, :player_two_score
end
