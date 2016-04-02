FactoryGirl.define do
  factory :live_game do
    player_one_slack filips
    player_two_slack nil
    in_progress true
  end
end
