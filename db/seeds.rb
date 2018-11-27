User.delete_all
Article.delete_all

#LOAD USERS
users = User.create!([ 
  { username: 'david01', email: 'test_01@gmail.com', password: 'qwer1234' },
  { username: 'david02', email: 'test_02@gmail.com', password: 'qwer1234' },
  { username: 'david03', email: 'test_03@gmail.com', password: 'qwer1234' },
  { username: 'david04', email: 'test_04@gmail.com', password: 'qwer1234' },
  { username: 'david05', email: 'test_05@gmail.com', password: 'qwer1234' },
  { username: 'david06', email: 'test_06@gmail.com', password: 'qwer1234' }
])
puts '======COMPLETE Users Load======'

#LOAD ARTICLES
num = 0
18.times do
  num += 1
  Article.create!(
    title: "Interesting Title #{num}",
    description: "This is description no.: #{num}.",
    user_id: rand(1..6)
  )
end
puts '======COMPLETE Articles Load======'