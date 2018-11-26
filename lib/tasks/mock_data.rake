require 'faker'

namespace :mock do
  desc "create mocked data for environment"
  task data: :environment do
    puts "===================SEEDING DATABASE============================"
    create_mock_users
    create_mock_articles
  end

  private
  
  def create_mock_users
    num = 0
    6.times do 
      num +=1
      User.create!(
        username: Faker::Name.name,
        email: "test_0#{num}@gmail.com",
        password: 'qwer1234'
      )
    end
    puts 'COMPLETE'
  end

  def create_mock_articles
    num = 0
    18.times do
      num +=1
      Article.create!(
        title: "Interesting Title #{num}",
        description: "This is description no.: #{num}.",
        user_id: rand(1..6)
      )
    end
    puts 'COMPLETE'
  end
end
