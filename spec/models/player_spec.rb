require 'spec_helper'
require 'factory_girl'


describe Player do
  before(:each) do
    @good_player = build(:good_player)
    @avg_player = build(:avg_player)
    @bad_player = build(:bad_player)
  end

  it "has a valid factory" do
    expect(@good_player).to be_valid
  end

  it "is invalid without a display name"
  it "is invalid without a slack handle"
  it "must have a unique display name"
  it "must have a unique slack handle"
  

end
