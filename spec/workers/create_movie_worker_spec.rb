# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CreateMovieWorker, type: :worker do
  describe '#perform' do
    subject { described_class.new.perform(title) }

    let(:title) { 'Batman' }
    let(:import_movie_service) { instance_double(ImportMovie) }

    it 'calls ImportMovie service' do
      expect(ImportMovie).to receive(:new).with(title).and_return(import_movie_service)
      expect(import_movie_service).to receive(:call)

      subject
    end
  end
end
