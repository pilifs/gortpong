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
      
    end
  end

  describe '#reset_game' do
    it 'sets score to 0'
    it 'sets in_progress to false'
    it 'sets slack handles to nil'
  end

  describe '#display_name' do
    context 'when given a player slack handle' do
      it 'returns the associated display name'
    end
    context 'when slack handle is nil' do
      it 'returns awaiting game text'
    end
  end


end
