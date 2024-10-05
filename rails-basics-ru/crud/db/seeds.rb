# frozen_string_literal: true

10.times do |index|
  Task.create(
    name: Faker::Lorem.sentence,
    description: Faker::Lorem.paragraphs.join("\n"),
    creator: Faker::Name.name,
  )
end