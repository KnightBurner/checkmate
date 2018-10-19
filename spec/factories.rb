FactoryBot.define do
  factory :game do   
    sequence(:white_player_id)
    player_turn { nil }
  end

  factory :player do
  end

  factory :chess_piece do 
  end

  factory :user do
    sequence(:email) { |n| "dummyEmail#{n}@gmail.com" }
    password { 'secretPassword' }
    password_confirmation { 'secretPassword'  }
  end
end