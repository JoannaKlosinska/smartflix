# frozen_string_literal: true

FactoryBot.define do
  factory :movie do
    title { Faker::Movie.title }
    year { Faker::Number.between(from: 1950, to: 2021) }
  end
end
