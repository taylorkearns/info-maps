require 'spec_helper'

feature '"Find the Country" game' do
  before do
    @game = Game.first
    @region = Region.first
    @countries = 10.times { create :country, region_id: @region.id }
  end

  scenario 'beginning the game' do
    pending

    visit game_region_path(game_id: @game.id, id: @region.id)

    click_on 'Begin'
  end

  scenario 'selecting an incorrect country'

  scenario 'selecting the correct country'

  scenario 'skipping a country'

  scenario 'completing the game'
end
