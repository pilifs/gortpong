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
    context "with 0 points and X games played" do
      it "should return 0" do
        # This is going to have to be repeated for the rest of the #avg_points specs because DatabaseCleaner is removing everything from the DB after every test. Needs to be created for association. I'm sure there is a better way.
        no_points = create(:bad_player, games_played: 3, slack_handle: "nopoints")
        all_points = create(:good_player, games_played: 3, slack_handle: "allpoints")
        3.times {create(:game, loser_slack: "nopoints", winner_slack: "allpoints", loser_score: 0)}
        expect(no_points.avg_points).to eq(0)
      end
    end
    context "with 50 points and 4 games played" do
      it "should return 12.5" do
        fifty_points = create(:bad_player, games_played: 4, slack_handle: "fifty_points")
        some_points = create(:good_player, games_played: 4, slack_handle: "some_points")
        create(:game, loser_slack: "fifty_points", winner_slack: "some_points", loser_score: 10)
        create(:game, loser_slack: "fifty_points", winner_slack: "some_points", loser_score: 10)
        create(:game, loser_slack: "fifty_points", winner_slack: "some_points", loser_score: 9)
        create(:game, loser_slack: "some_points", winner_slack: "fifty_points", winner_score: 21)
        expect(fifty_points.avg_points).to eq(12.5)
      end
    end
    context "with 43 points and 3 games played" do
      it "should return 14.33 (round 14.333 down to 2 decimals)" do
        player1 = create(:bad_player, games_played: 3, slack_handle: "player1")
        create(:good_player, games_played: 3, slack_handle: "player2")
        create(:game, loser_slack: "player2", winner_slack: "player1", loser_score: 0, winner_score: 21)
        create(:game, loser_slack: "player1", winner_slack: "player2", loser_score: 12)
        create(:game, loser_slack: "player1", winner_slack: "player2", loser_score: 10)
        expect(player1.avg_points).to eq(14.33)
      end
    end
    context "with 55 points and 6 games played" do
      it "should return 9.17 (round 9.166 up to 2 decimals)" do
        player1 = create(:bad_player, games_played: 6, slack_handle: "player1")
        create(:good_player, games_played: 6, slack_handle: "player2")
        create(:game, loser_slack: "player2", winner_slack: "player1", loser_score: 0, winner_score: 21)
        create(:game, loser_slack: "player1", winner_slack: "player2", loser_score: 4)
        create(:game, loser_slack: "player1", winner_slack: "player2", loser_score: 10)
        create(:game, loser_slack: "player1", winner_slack: "player2", loser_score: 10)
        create(:game, loser_slack: "player1", winner_slack: "player2", loser_score: 10)
        expect(player1.avg_points).to eq(9.17)
      end
    end
  end

end
