FactoryGirl.define do
    factory :product do
      title                { Faker::Book.author + " is " + Faker::SlackEmoji.people + " in " + Faker::Team.state }
      description          { Faker::Hacker.say_something_smart }
      price                { 10 + rand(100000) }
      sale_price           { price ? price - price / 10 : 1 + rand(10) }
     end
end
