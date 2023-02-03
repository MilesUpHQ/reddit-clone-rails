
if Rails.env.development?
  Account.create!(first_name: 'Tushar', last_name: 'R', username: 'iamtusharxo', email: 'tushar@gmail.com',
                  password: '123456', password_confirmation: '123456')
  Account.create!(first_name: 'Magesh', last_name: 'I', username: 'imagesh', email: 'magesh@gmail.com',
                  password: '123456', password_confirmation: '123456')
  Account.create!(first_name: 'Krishna', last_name: 'Veni', username: 'veni', email: 'krishnaveni@gmail.com',
                  password: '123456', password_confirmation: '123456')
  Account.create!(first_name: 'Mithun', last_name: 'L', username: 'mithun', email: 'mithun@gmail.com',
                  password: '123456', password_confirmation: '123456')
  Account.create!(first_name: 'Srinandhini', last_name: 'M', username: 'sri', email: 'srinandhini@gmail.com',
                  password: '123456', password_confirmation: '123456')
  Account.create!(first_name: 'Sowndar', last_name: 'K', username: 'sowndar', email: 'sowndar@gmail.com',
                  password: '123456', password_confirmation: '123456')
  Account.create!(first_name: 'Vasanth', last_name: 'A', username: 'vasi', email: 'vasanthakumar@gmail.com',
                  password: '123456', password_confirmation: '123456')
  Account.create!(first_name: 'Aboorva', last_name: 'K', username: 'aboo', email: 'aboorva@gmail.com',
                  password: '123456', password_confirmation: '123456')
  Account.create!(first_name: 'Karthiga', last_name: 'K', username: 'karthu', email: 'karthiga@gmail.com',
                  password: '123456', password_confirmation: '123456')
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