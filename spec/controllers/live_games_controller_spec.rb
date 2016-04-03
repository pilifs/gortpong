require 'rails_helper'

RSpec.describe LiveGamesController, type: :controller do

  it 'should always use the live layout' do
    get :index # Don't think it's worth testing all actions... would be interested to see if there was a way of doing this easily here without repitition
    expect(response).to render_template(layout: :live) # layout
  end

  describe 'POST #create' do
    context 'with a valid table name' do
      it 'redirects to the index page' do
        post :create, live_game: { table_name: "Test" }
        expect(response).to redirect_to(:live_games)
      end
    end
    context 'without a valid table name' do
      it 're-renders the #new form' do
        post :create, live_game: { table_name: '' }
        expect(response).to render_template(:new)
      end
    end
  end
end
