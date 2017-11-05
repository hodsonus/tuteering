# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#


puts "Create example parent"
User.create(
  email: "email@example.com",
  password: "password",
  first_name: "Email",
  last_name: "Example",
  bio: "Some default bio",
  zipcode: 00000,
  kind: "Parent"
)

puts "Creating tutors"
5.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  email = Faker::Internet.free_email
  bio = Faker::Lorem.paragraph
  subject = "Science"
  age =  rand(18..30)
  zipcode = 11111
  kind = "Tutor"
  qualification = "Highschool Diploma"

  user = User.create(
    first_name: first_name,
    last_name: last_name,
    email: email,
    bio: bio,
    subject: subject,
    zipcode: zipcode,
    kind: kind,
    password: "password",
    qualifications: qualification,
    password: "password",
  )

end

5.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  email = Faker::Internet.free_email
  bio = Faker::Lorem.paragraph
  subject = "Math"
  age =  rand(18..30)
  zipcode = 00000
  kind = "Tutor"
  qualification = "Pursuing Bachelors"

  User.create(
    first_name: first_name,
    last_name: last_name,
    email: email,
    bio: bio,
    subject: subject,
    zipcode: zipcode,
    kind: kind,
    password: "password",
    qualifications: qualification,
    password: "password"
  )
end

5.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  email = Faker::Internet.free_email
  bio = Faker::Lorem.paragraph
  subject = "Reading"
  age =  rand(18..30)
  zipcode = 22222
  kind = "Tutor"
  qualification = "Pursuing Bachelors"
  password = password

  User.create(
    first_name: first_name,
    last_name: last_name,
    email: email,
    bio: bio,
    subject: subject,
    zipcode: zipcode,
    kind: kind,
    qualifications: qualification,
    password: "password"
  )
end


puts "Creating parents"
5.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  email = Faker::Internet.free_email
  bio = Faker::Lorem.paragraph
  subject = "Reading"
  age =  rand(30..40)
  zipcode = 22222
  kind = "Parent"
  qualification = "Pursuing Bachelors"

  User.create(
    first_name: first_name,
    last_name: last_name,
    email: email,
    bio: bio,
    zipcode: zipcode,
    kind: kind,
    password: "password"
  )
end

puts "Creating children"
5.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  age =  rand(18..40)
  grade =  rand(6..18)
  parent_id = User.where(kind: "Parent").first.id
  email = Faker::Internet.email
  paragraph = Faker::Lorem.paragraph

  user = User.create(
    first_name: first_name,
    last_name: last_name,
    age: age,
    grade: grade,
    password: "password",
    parent_id: parent_id,
    kind: "Child",
    email: email,
    comments: "<div> #{paragraph} </div>"
  )

end
