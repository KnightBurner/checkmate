require 'rails_helper'
include Warden::Test::Helpers

feature "Moving a piece", type: :feature do

  scenario 'click on game board piece' do
    @game = FactoryBot.create(:game)
    @chesspiece = @game.chess_pieces.first
    visit "games/#{@game.id}"
    link = find(:xpath, "//a[contains(@href, 'chess_pieces/#{@game.chess_pieces.first.id}')]")
    link.click
    expect(page).to have_content "Chesspiece Show page"
  end

end