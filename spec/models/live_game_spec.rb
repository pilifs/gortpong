require 'rails_helper'

RSpec.describe LiveGame, type: :model do

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
