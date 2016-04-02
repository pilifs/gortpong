FactoryGirl.define do
  factory :live_game do
    table_name 'Bitmaker Labs'
    player_one_slack 'filips'
    in_progress true
  end
end
