# This file should contain all the record creation needed to seed the database with its default values.
AdminUser.create!(email: 'admin123@reddit.com', password: 'p@ssword', password_confirmation: 'p@ssword') if Rails.env.development?


10.times do 
   Community.create!(
    account_id: rand(1..3),
    name: Faker::Name.name,
    url: Faker::Internet.url,
    rules: Faker::Lorem.paragraphs,
    summary: Faker::Lorem.paragraphs,
    category: %w[Sports Gaming Technology News TV Music Crypto Fasion Food Health Science Finance].sample      
  )
end
