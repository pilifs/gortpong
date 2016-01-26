class Player < ActiveRecord::Base
  has_many :games_won, :class_name => 'Game', :foreign_key => 'winner_id'
  has_many :games_lost, :class_name => 'Game', :foreign_key => 'loser_id'
end
