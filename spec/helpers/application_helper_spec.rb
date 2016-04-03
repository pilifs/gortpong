require "rails_helper"

RSpec.describe ApplicationHelper, :type => :helper do

  # These tests have little value
  # Did not allow me to use Capybara 'visit' to initiate the tests, and even if it did... not worth slowing down tests that much
  before(:each) do
    allow(self).to receive(:current_page?).and_return(true)
  end

  describe "#cp" do
    context 'inputted path matches the current page' do
      it 'returns a string with value "current-link"' do
        expect(cp(players_path)).to eq("current-link")
      end
    end
  end

  describe '#btn_path' do
    context 'inputted path matches the current button' do
      it 'returns a string with value "current-btn"' do
        expect(btn_path(players_path)).to eq("current-btn")
      end
    end
  end
end
