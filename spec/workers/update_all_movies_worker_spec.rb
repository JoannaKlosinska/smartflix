# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UpdateAllMoviesWorker, type: :worker do
  describe '#perform' do
    subject { described_class.new.perform }

    let(:movie) { build(:movie) }

    it 'runs update one movie worker' do
      allow(Movie).to receive(:find_each).and_yield(movie)
      expect(UpdateOneMovieWorker).to receive(:perform_async).with(movie.id)
      subject
    end
  end
end
