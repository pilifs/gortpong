require 'faker'

FactoryGirl.define do
  factory :game do
    winner_score 21
    loser_score 15
    user_id 1
    winner_slack "winner"
    loser_slack "loser"
  end
end
