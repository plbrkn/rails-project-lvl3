# frozen_string_literal: true

categories = %w[Car House Stuff "Home Staff"]

categories.each do |name|
  Category.create(name: name)
end

categories = Category.all

user = User.create(name: Faker::Name.name, email: 'admin@example.com')

5.times do
  bulletin = Bulletin.new(
    name: Faker::Lorem.word,
    body: Faker::Lorem.paragraph,
    user_id: user.id,
    category_id: categories.sample.id
  )
  bulletin.photo.attach(io: File.open(Rails.root.join('app/assets/images/cat.jpeg')), filename: 'cat.jpeg', content_type: 'image/jpeg')
  bulletin.save!
end
