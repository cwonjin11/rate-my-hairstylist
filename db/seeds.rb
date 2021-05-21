# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


### Order matters here!!! ####

UserStylist.destroy_all
    Stylist.destroy_all
    User.destroy_all

    ###################

#####    User    ######
    10.times do
        User.create!(username: Faker::Internet.unique.username, 
            email: Faker::Internet.unique.email, 
            password: "123", 
            uid: "your-google-id", 
            provider: "google"
        )
    end
########################


#####    Stylist    ######
15.times do
    Stylist.create!(name: Faker::Artist.unique.name, 
        phone: Faker::PhoneNumber.cell_phone, 
        shop_name: Faker::Coffee.blend_name, 
        address: Faker::Address.full_address
    )
end

########################


#####    UserStylist    ######
40.times do
    UserStylist.create!(haircut_date: Faker::Date.between(from: '2021-01-01', to: Date.today), 
        stars: rand(1..5), 
        comment: Faker::Restaurant.review, 
        services: Faker::Dessert.flavor, 
        price: Faker::Number.decimal(l_digits: 2), 
        user: User.all.sample, 
        stylist: Stylist.all.sample
    )
end


########################



puts "
BADA BING, 
BADA BOOM!!
"
