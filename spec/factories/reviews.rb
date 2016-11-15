FactoryGirl.define do
  factory :review do
    star_count { 1 + rand(4)}
    body { Faker::ChuckNorris.fact }
  end
end
