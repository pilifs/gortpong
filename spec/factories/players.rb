require 'faker'

FactoryGirl.define do
  factory :good_player, class: Player do
    games_played 10
    wins 9
    losses 1
    rating {Rating.create(rating: 1600, highest_ever: 1600)}
    slack_handle 'good_player'
    display_name 'GoodPlayer'
    plus_minus 115
    user_id 1
    win_streak 5
  end
end
