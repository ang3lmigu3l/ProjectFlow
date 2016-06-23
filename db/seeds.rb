# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

  5.times do
    User.create!(
      :first_name => Faker::Name.first_name,
      :last_name => Faker::Name.last_name,
      :email => Faker::Internet.email,
      :date_of_birth => Faker::Date.between(10.days.ago, Date.today),
      :password => '12341234',
      :password_confirmation => '12341234'
    )
  end

  admin = User.create!(
  :first_name => 'Miguel',
  :last_name => 'Quintana',
  :email => 'quintana.mige@gmail.com',
  :date_of_birth => Faker::Date.between(10.days.ago, Date.today),
  :password => '12341234',
  :password_confirmation => '12341234'
  )

    users = User.all

  100.times do
    Project.create!(
    :user => users.sample,
    :title => Faker::Lorem.words(3),
    :description => Faker::Lorem.sentence,
    :body => Faker::Lorem.paragraph(4),
    :completed => false,
    :date_started => Faker::Date.between(10.days.ago, Date.today)

    )
  end



  puts "#{User.count} were created "
  puts "#{Project.count} were created"
