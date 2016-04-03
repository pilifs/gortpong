FactoryGirl.define do
  factory :good_rating, class: Rating do
    rating '1600'
    highest_ever '1550'
    avg_opp_rating '1500'
    avg_opp_rating_win '1490'
    avg_opp_rating_loss '1510'
  end

  factory :bad_rating, class: Rating do
    rating '1300'
  end

  factory :rating do
  end
end
