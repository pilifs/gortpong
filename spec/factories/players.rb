require 'faker'

# There is probably a better way to do this to avoid repitition and only change the variables I need to. Will look into it later.

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

  factory :avg_player, class: Player do
    games_played 2
    wins 1
    losses 1
    rating {Rating.create(rating: 1500, highest_ever: 1500)}
    slack_handle 'avg_player'
    display_name 'AvgPlayer'
    plus_minus 0
    user_id 1
    win_streak 1
  end

  factory :bad_player, class: Player do
    games_played 10
    wins 1
    losses 10
    rating {Rating.create(rating: 1400, highest_ever: 1600)}
    slack_handle 'bad_player'
    display_name 'BadPlayer'
    plus_minus -95
    user_id 1
    win_streak 0
  end
end
