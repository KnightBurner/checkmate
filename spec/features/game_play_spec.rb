require 'rails_helper'
include Warden::Test::Helpers

feature "User game management", type: :feature do

  scenario 'moving a piece' do
    @game = FactoryBot.create(:game)
    @chesspiece = @game.chess_pieces.first
    visit "games/#{@game.id}"
    link = find(:xpath, "//a[contains(@href, 'chess_pieces/#{@game.chess_pieces.first.id}')]")
    link.click
    expect(page).to have_content "Chesspiece Show page"
  end

end

feature "Moving a piece", type: :feature do

end