category_attributes = [
  { name: "Language" },
  { name: "Framework" },
  { name: "Library" }
]

category_attributes.each do |attributes|
  Category.where(attributes).first_or_create
end

technology_attributes = [
  { name: "JavaScript", category: Category.first },
  { name: "Ruby", category: Category.first },
  { name: "Python", category: Category.first },
  { name: "Java", category: Category.first },
  { name: "C#", category: Category.first },
  { name: "SQL", category: Category.first },
  { name: "RoR", category: Category.second },
  { name: "Django", category: Category.second },
  { name: "Angular", category: Category.second },
  { name: "Ember", category: Category.second },
  { name: "Sails", category: Category.second },
  { name: "jQuery", category: Category.third },
  { name: "React", category: Category.third }
]

technology_attributes.each do |attributes|
  Technology.where(attributes).first_or_create
end

language_attributes = [
  { name: "English" },
  { name: "Polish" },
  { name: "Spanish" }
]

language_attributes.each do |attributes|
  Language.where(attributes).first_or_create
end

test_password = "Testpass"

if User.all.size < 60
  60.times do
    User.create(
      email: Faker::Internet.email,
      password: test_password,
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      description: Faker::Lorem.paragraph(rand(10..20)),
      location: "#{Faker::Address.city}, #{Faker::Address.country}"
    )
  end
end


# Add technologies to users
available_technologies = Technology.all
User.all.each do |user|
  user.levels.destroy_all
  available_technologies.sample(rand(0..5)).each do |technology|
    user.levels.create(technology: technology, level: rand(0..3))
  end
end

# Add languages to users
available_languages = Language.all
User.all.each do |user|
  user.speakers.destroy_all
  available_languages.sample(rand(1..3)).each do |language|
    user.speakers.create(language: language)
  end
end

# Create user opinions
Opinion.all.destroy_all
all_users = User.all
all_users.each do |user|
  authors = all_users.reject { |author| author.id == user.id }
  authors.sample(rand(2..7)).each do |author|
    user.received_opinions.create(
      rating: rand(1..5),
      content: Faker::Lorem.paragraph(rand(10..15)),
      author_id: author.id
    )
  end
end

# Create meetups
Meetup.all.destroy_all
30.times do
  Meetup.create(
    title: "#{Faker::Hacker.adjective.capitalize} #{Faker::Hacker.adjective} #{Faker::Hacker.adjective}",
    description: Faker::Hacker.say_something_smart,
    lat: Faker::Address.latitude,
    lng: Faker::Address.longitude,
    date: Time.now + rand(-100..100).days + rand(1..300).minutes,
    technology: available_technologies.sample,
    language: available_languages.sample,
    author: all_users.sample
  )
end
