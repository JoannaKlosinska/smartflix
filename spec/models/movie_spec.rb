# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Movie, type: :model do
  it 'is valid with correct attributes' do
    first_movie = Movie.new(title: 'Star Wars')
    expect(first_movie).to be_valid
  end

  it 'is invalid wihout a title' do
    second_movie = Movie.new(title: nil)
    expect(second_movie).to_not be_valid
  end
end
