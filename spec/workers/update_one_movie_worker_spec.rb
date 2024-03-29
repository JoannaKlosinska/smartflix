# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UpdateOneMovieWorker, type: :worker do
  describe '#perform' do
    subject { described_class.new.perform(movie_id) }

    let(:movie) { create(:movie) }
    let(:movie_id) { movie.id }
    let(:update_movie_service) { instance_double(UpdateMovie) }

    it 'runs update movie service' do
      expect(UpdateMovie).to receive(:new).with(movie).and_return(update_movie_service)
      expect(update_movie_service).to receive(:call)

      subject
    end
  end
end
