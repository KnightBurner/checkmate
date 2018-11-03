require 'rails_helper'
include Warden::Test::Helpers
 
 feature "User game management", type: :feature do
   
    scenario 'joining a game' do   
      user = FactoryBot.create(:user)
      game = FactoryBot.create(:game)
      login_as(user, :scope => :user)
      visit '/games'
      click_button 'Join Game'
      expect(page).to have_content "Show Games"
    end

    scenario 'joining a game' do
      game = FactoryBot.create(:game)
      visit '/games'
      click_button 'Join Game'
      expect(page).to have_content "You need to sign in or sign up before continuing"
    end
  end