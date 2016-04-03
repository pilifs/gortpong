require 'spec_helper'

RSpec.describe LiveGame, type: :model do
  describe '#elo_rating_change' do
    context 'with equal ratings' do
      it 'should return half of k-factor'
    end
    context 'with 100 rating difference' do
      it 'should return 12 if favorite wins'
      it 'should return 20 if underdog wins'
    end
    context 'with 200 rating difference' do
      it 'should return 8 if favorite wins'
      it 'should return 24 if underdog wins'
    end
  end

  describe '.update_ratings' do
    before do
      @player1 = create(:player)
      @player2 = create(:player)
    end
    context 'with equal ratings' do
      it 'should return half of k-factor' do
        expect(Rating.update_ratings(@player1, @player2)).to eq(32 / 2)
      end
    end
    context 'with 100 rating difference' do
      before do
        @player1.rating.rating += 100
      end
      it 'should return 12 if favorite wins' do
        expect(Rating.update_ratings(@player1, @player2)).to eq(12)
      end
      it 'should return 20 if underdog wins' do
        expect(Rating.update_ratings(@player2, @player1)).to eq(20)
      end
    end
    context 'with 200 rating difference' do
      before do
        @player1.rating.rating += 200
      end
      it 'should return 8 if favorite wins' do
        expect(Rating.update_ratings(@player1, @player2)).to eq(8)
      end
      it 'should return 24 if underdog wins' do
        expect(Rating.update_ratings(@player2, @player1)).to eq(24)
      end
    end
  end

  describe '#calculate_avg_opp_rating_win' do
    context 'first game ever played' do
      it 'should return the opponent\'s rating'
    end
    it 'should return an average of all opponents\' rating in wins'
  end

  describe '#calculate_avg_opp_rating_loss' do
    context 'first game ever played' do
      it 'should return the opponent\'s rating'
    end
    it 'should return an average of all opponents\' rating in losses'
  end
end
