require 'spec_helper'
require 'factory_girl'


describe Player do
  before(:each) do
    @good_player = build(:good_player)
  end

  it "has a valid factory" do
    @good_player.should be_valid
  end
end
