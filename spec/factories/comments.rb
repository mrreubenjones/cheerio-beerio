FactoryGirl.define do
  factory :comment do
    body { Faker::Hipster.sentence(3) }
  end
end
