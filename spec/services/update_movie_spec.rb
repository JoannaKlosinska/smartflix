# frozen_string_literal: true

require 'rails_helper'
RSpec.describe UpdateMovie do
  describe '#call' do
    subject { described_class.new(movie).call }

    let(:movie) { create(:movie, updated_at: updated_at, **identical_movie_attributes) }
    let(:updated_at) { 1.week.ago }
    let(:identical_movie_attributes) { { imdb_rating: '7.5', imdb_votes: '351,618' } }
    let(:different_movie_attributes) { { imdb_rating: '8.0', imdb_votes: '400,000' } }

    before do
      travel_to(Time.zone.parse('2020-08-03 12:00:00'))
    end

    context 'with identical movie attributes' do
      it 'updates only updated_at attribute' do
        expect(OmdbapiAdapter).to receive(:find).with(movie.title).and_return(movie.attributes)
        subject
        movie.reload
        expect(movie.updated_at).to eq('2020-08-03 12:00:00.000000000 +0200')
        expect(movie.imdb_rating).to eq '7.5'
        expect(movie.imdb_votes).to eq '351,618'
      end
    end

    context 'with different movie attributes' do
      it 'updates every different attributes' do
        expect(OmdbapiAdapter).to receive(:find).with(movie.title)
                                                .and_return(movie.attributes.merge(different_movie_attributes))
        subject
        movie.reload
        expect(movie.updated_at).to eq('2020-08-03 12:00:00.000000000 +0200')
        expect(movie.imdb_rating).to eq '8.0'
        expect(movie.imdb_votes).to eq '400,000'
      end
    end
  end
end
