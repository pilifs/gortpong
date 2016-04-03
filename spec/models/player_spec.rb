require 'spec_helper'

describe Player do
  before(:each) do
    @good_player = build(:good_player)
    @avg_player = build(:avg_player)
    @bad_player = build(:bad_player)
  end

  it "has a valid factory" do
    expect(@good_player).to be_valid
  end

  context "when creating a new player" do
    it "is invalid without a display name" do
      expect(build(:good_player, display_name: nil)).not_to be_valid
    end
    it "is invalid without a slack handle" do
      expect(build(:good_player, slack_handle: nil)).not_to be_valid
    end
    it "must have a unique display name" do
      create(:good_player, display_name: "repeat")
      expect(build(:good_player, display_name: "repeat")).not_to be_valid
    end
    it "must have a unique slack handle" do
      create(:good_player, slack_handle: "repeat")
      expect(build(:good_player, slack_handle: "repeat")).not_to be_valid
    end
  end

  describe '#win_percentage' do
    context "with equal wins and losses" do
      it "should return 50.0" do
        wins = 3
        losses = 3
        games_played = wins + losses
        fifty_percent = build(:avg_player, wins: wins, losses: losses, games_played: games_played)
        expect(fifty_percent.win_percentage).to eq(wins / games_played.to_f * 100)
      end
    end
    context "with no games played" do
      it "returns n/a with no games played" do
        never_played = build(:avg_player, games_played: 0)
        expect(never_played.win_percentage).to eq('n/a')
      end
    end
    context "with only wins and no losses" do
      it "returns 100" do
        all_wins = build(:good_player, losses: 0)
        expect(all_wins.win_percentage).to eq(100)
      end
    end
    it "returns 0 with only losses and no wins" do
      no_wins = build(:bad_player, wins: 0)
      expect(no_wins.win_percentage).to eq(0)
    end
    it "rounds to 2 decimal places" do
      one_of_three = build(:bad_player, games_played: 3, losses: 2)
      expect(one_of_three.win_percentage).to eq(33.33)
    end
  end

  describe '#avg_points' do
    context "with no games played" do
      it "should return 0" do
        no_games = build(:bad_player, games_played: 0)
        expect(no_games.avg_points).to eq(0)
      end
    end
  end

end
