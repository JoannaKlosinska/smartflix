# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UpdateOneMovieWorker, type: :worker do
  describe '#perform' do
    subject { described_class.new.perform(movie_id) }

    let(:movie) { create(:movie) }
    let(:movie_id) { movie.id }

    before do
      allow(UpdateMovie).to receive(:new).with(movie)
    end

    it 'runs update movie service' do
      expect(UpdateMovie.new(movie)).to receive(:call)

      subject
    end
  end
end
