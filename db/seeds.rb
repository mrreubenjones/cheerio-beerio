# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Category options
category = ['Homeware', 'Hilarious', 'Hate crimes', 'Holy Books', 'Hot Dogs', 'Haberdashery']

6.times do
  Category.create({name: Faker::Beer.style})
end



# ADDING USERS TO THE USER TABLE
1000.times do

  User.create({
          first_name:     Faker::Name.first_name,
          last_name:      Faker::Team.state,
          email:          Faker::Internet.email,
          password:       Faker::Name.first_name
    })

end

# ADDING PRODUCTS TO THE PRODUCT TABLE
1000.times do

  Product.create({
          title:            Faker::Beer.name,
          description:      Faker::Beer.style,
          price:            rand(10000),
          category_id:      1 + rand(5),
          user_id:          1 + rand(999)
    })

end








puts "YO DB HAS BEEN SEEDED. Again."