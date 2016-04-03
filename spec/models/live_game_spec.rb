require 'rails_helper'

RSpec.describe LiveGame, type: :model do
  before(:each) do
    @live_game = build(:live_game)
  end

  it "has a valid factory" do
    expect(@live_game).to be_valid
  end

  context 'when creating a live game' do
    it 'must have a table_name' do
      expect(build(:live_game, table_name: nil)).not_to be_valid
    end
    it 'table_name must be unique' do
      create(:live_game, table_name: 'Repeat')
      expect(build(:live_game, table_name: 'Repeat')).not_to be_valid
    end
  end

  describe '#reset_game' do
    before do
      @live_game.reset_game
    end
    it 'sets player one score to 0' do
      expect(@live_game.player_one_score).to eq(0)
    end
    it 'sets player two score to 0' do
      expect(@live_game.player_two_score).to eq(0)
    end
    it 'sets in_progress to false' do
      expect(@live_game.in_progress).to eq(false)
    end
    it 'sets player one slack handle to nil' do
      expect(@live_game.player_one_slack).to eq(nil)
    end
    it 'sets player two slack handle to nil' do
      expect(@live_game.player_two_slack).to eq(nil)
    end
  end

  describe '#display_name' do
    context 'when given a registered player slack handle' do
      it 'returns the associated display name' do
        @filip = create(:good_player, slack_handle: 'filips', display_name: 'Fil')
        expect(@live_game.display_name(@filip.slack_handle)).to eq('Fil')
      end
    end
    context 'when slack handle is nil' do
      it 'returns awaiting opponent' do
        expect(@live_game.display_name(nil)).to eq('Awaiting Opponent')
      end
    end
  end


end
