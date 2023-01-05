AdminUser.create!(email: 'admin@reddit.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
AdminUser.create!(email: 'admin@example.com', password: '123456', password_confirmation: '123456') if Rails.env.development?

# for these Accounts you need to confirmation token for logging in
Account.create!(first_name: 'Vasanth', last_name: 'A', username: 'vasi', email: 'vasanthakumar@gmail.com', password: '123456', password_confirmation: '123456', confirmed_at: Time.now) if Rails.env.development?
Account.create!(first_name: 'Tushar', last_name: 'R', username: 'iamtusharxo', email: 'tushar@gmail.com', password: '123456', password_confirmation: '123456', confirmed_at: Time.now) if Rails.env.development?
Account.create!(first_name: 'Magesh', last_name: 'I', username: 'imagesh', email: 'magesh@gmail.com', password: '123456', password_confirmation: '123456', confirmed_at: Time.now) if Rails.env.development?
Account.create!(first_name: 'Krishna', last_name: 'Veni', username: 'veni', email: 'krishnaveni@gmail.com', password: '123456', password_confirmation: '123456', confirmed_at: Time.now) if Rails.env.development?
Account.create!(first_name: 'Mithun', last_name: 'L', username: 'mithun', email: 'mithun@gmail.com', password: '123456', password_confirmation: '123456', confirmed_at: Time.now) if Rails.env.development?
Account.create!(first_name: 'Srinandhini', last_name: 'M', username: 'sri', email: 'srinandhini@gmail.com', password: '123456', password_confirmation: '123456', confirmed_at: Time.now) if Rails.env.development?
Account.create!(first_name: 'Sowndar', last_name: 'K', username: 'sowndar', email: 'sowndar@gmail.com', password: '123456', password_confirmation: '123456', confirmed_at: Time.now) if Rails.env.development?
Account.create!(first_name: 'Aboorva', last_name: 'K', username: 'aboo', email: 'aboorva@gmail.com', password: '123456', password_confirmation: '123456', confirmed_at: Time.now) if Rails.env.development?
Account.create!(first_name: 'Karthiga', last_name: 'K', username: 'karthu', email: 'karthiga@gmail.com', password: '123456', password_confirmation: '123456', confirmed_at: Time.now) if Rails.env.development?

%w[Sports Gaming Technology News TV Music Crypto Fashion Food Health Science Finance].each do |category|
  Category.create!(name: category)
end

if Account.exists?
  account_ids = Account.pluck(:id)
end

if Category.exists?
  categories = Category.pluck(:name)
end

10.times do
   Community.create!(
    account_id: account_ids.sample,
    name: Faker::Name.name,
    url: Faker::Internet.url,
    rules: Faker::Lorem.paragraphs,
    summary: Faker::Lorem.paragraphs,
    category: categories.sample
  )
end

if Community.exists?
  communities = Community.pluck(:id)
end

30.times do
   Post.create!(
    account_id: account_ids.sample,
    community_id: communities.sample,
    title: Faker::Name.name,
    body: Faker::Lorem.paragraph(sentence_count: 2),
    is_drafted: false,
  )
end

%w[Spam Copyright Hate Impersonation Harassment].each do |category|
  ReportCategory.create!(name: category)
end

["Harmful Bots","Unsolicited Messaging"].each do |reason|
  ReportReason.create!(
    report_category_id: 1,
    reason: reason
  )
end

["Yours or an individual","Someone else's"].each do |reason|
ReportReason.create!(
  report_category_id: 2,
  reason: reason
)
end

["About you","Social problem"].each do |reason|
  ReportReason.create!(
    report_category_id: 3,
    reason: reason
  )
end

["Fraud","purpose of entertainment"].each do |reason|
  ReportReason.create!(
    report_category_id: 4,
    reason: reason
  )
end

["You","Someone else"].each do |reason|
ReportReason.create!(
  report_category_id: 5,
  reason: reason
)
end
