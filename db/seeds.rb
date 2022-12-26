# This file should contain all the record creation needed to seed the database with its default values.
AdminUser.create!(email: 'admin1123@reddit.com', password: 'p@ssword', password_confirmation: 'p@ssword') if Rails.env.development?


50.times do
  account=Account.new(

    username: Faker::Internet.user_name,
    email: Faker::Internet.email,
    password: Faker::Internet.password
  )
end

user.save!
10.times do 
   Community.create!(
    account_id: rand(1..50),
    name: Faker::Name.name,
    url: Faker::Internet.url,
    rules: Faker::Lorem.paragraphs,
    summary: Faker::Lorem.paragraphs,
    category: %w[Sports Gaming Technology News TV Music Crypto Fasion Food Health Science Finance].sample      
  )
end
