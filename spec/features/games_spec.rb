require 'spec_helper'

feature 'viewing and selecting games' do
  scenario 'viewing all games', js: true do
    games = Game.all

    visit games_path

    games.each do |game|
      page.should have_content(game.name)
    end
  end

  scenario 'selecting a game', js: true do
    game = Game.first
    regions = Region.all

    visit games_path

    click_on game.name

    page.current_path.should == game_path(game)

    page.should have_content('Select a Region')

    regions.each do |region|
      page.should have_content(region.name)
    end
  end
end
