10.times do
  User.create!(
    username: Faker::Name.unique.first_name,
    email: Faker::Internet.unique.email,
    password: "password"
  )
end
users = User.all

30.times do
  Topic.create!(
    title: Faker::Music.instrument,
    user: users.sample
  )
end

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Topic.count} topics created"
