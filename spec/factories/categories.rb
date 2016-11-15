FactoryGirl.define do
  factory :category do
    name { Faker::GameOfThrones.city } 
  end
end
