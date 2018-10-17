FactoryBot.define do
  factory :game do
    sequence :white_player_id do |n|
      "#{n}"
    end
    player_turn "nil"
  end
  
  factory :player do
    
  end
  factory :chess_piece do
    
  end
  factory :user do
    sequence :email do |n|
      "dummyEmail#{n}@gmail.com"
    end
    password {"secretPassword"}
    password_confirmation {"secretPassword"}
  end
end