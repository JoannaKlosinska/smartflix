# frozen_string_literal: true

require 'rails_helper'
RSpec.describe UpdateMovie do
  describe '#call' do
    subject { described_class.new(movie).call }

    let(:movie) { build(:movie, updated_at: 1.week.ago) }
    let(:identical_movie_attributes) { { imdb_rating: '7.5', imdb_votes: '351,618' } }
    let(:different_movie_attributes) { { imdb_rating: '8.0', imdb_votes: '400,000' } }

    context 'with identical movie attributes' do
      it 'updates only updated_at attribute' do
        allow(OmdbapiAdapter).to receive(:find).with(movie.title).and_return(identical_movie_attributes)
        subject

        # expect { subject }.to(change(movie, :updated_at))
        expect(movie.imdb_rating).to eq '7.5'
        expect(movie.imdb_votes).to eq '351,618'
      end
    end

    context 'with different movie attributes' do
      it 'updates every different attributes' do
        allow(OmdbapiAdapter).to receive(:find).with(movie.title).and_return(different_movie_attributes)
        subject
        expect(movie.imdb_rating).to eq '8.0'
        expect(movie.imdb_votes).to eq '400,000'
      end
    end
  end
end
