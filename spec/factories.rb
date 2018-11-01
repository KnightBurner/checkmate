FactoryBot.define do
  factory :game do   
  end

  factory :player do
  end

  factory :chess_piece do
    position_x {0}
    position_y {0} 
  end

  factory :user do
    sequence :email do |n|
      "dummyEmail#{n}@gmail.com"
    end
    password {"secretPassword"}
    password_confirmation {"secretPassword"}
  end

  factory :board do
    board = [[nil, nil, nil, nil, nil, nil, nil, nil],
             [nil, nil, nil, nil, nil, nil, nil, nil],
             [nil, nil, nil, nil, nil, nil, nil, nil],
             [nil, nil, nil, nil, nil, nil, nil, nil],
             [nil, nil, nil, nil, nil, nil, nil, nil],
             [nil, nil, nil, nil, nil, nil, nil, nil],
             [nil, nil, nil, nil, nil, nil, nil, nil],
             [nil, nil, nil, nil, nil, nil, nil, nil]]
  end
end