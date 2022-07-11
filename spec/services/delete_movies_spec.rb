# frozen_string_literal: true

require 'rails_helper'
RSpec.describe DeleteMovies do
  describe '#call' do
    subject { described_class.new(movies).call }

    let(:movies) { Movie.where(id: [first_movie.id, second_movie.id]) }
    let(:first_movie) { create(:movie) }
    let(:second_movie) { create(:movie) }
    let(:third_movie) { create(:movie) }

    before do
      first_movie
      second_movie
      third_movie
    end

    it 'deletes movies from specific list' do
      expect { subject }.to change(Movie, :count).from(3).to(1)
    end
  end
end
