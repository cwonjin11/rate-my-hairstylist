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
    20.times do
        User.create!(username: Faker::Internet.username, 
            email: Faker::Internet.email, 
            password: "123", 
            uid: "your-google-id", 
            provider: "google"
        )
    end
########################


#####    Stylist    ######
30.times do
    Stylist.create!(name: Faker::Name.name, 
        phone: Faker::PhoneNumber.cell_phone, 
        shop_name: Faker::Music::Prince.song, 
        address: Faker::Address.full_address
    )
end

########################


#####    UserStylist    ######
40.times do
    UserStylist.create!(haircut_date: Faker::Date.in_date_period, 
        stars: rand(1..5), 
        comment: Faker::Restaurant.review, 
        services: Faker::Superhero.prefix, 
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





