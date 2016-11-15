FactoryGirl.define do
  factory :discussion do
    title { Faker::Pokemon.name }
    body { Faker::Hipster.paragraphs }
  end
end
