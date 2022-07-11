# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DeleteOutdatedMoviesWorker, type: :worker do
  describe '#perform' do
    subject { described_class.new.perform(time) }
    let(:movie) { create(:movie, updated_at: datetime - 48.hours - 1.second) }
    let(:datetime) { Time.zone.parse('2020-08-03 12:00:00') }
    let(:time) { 48.hours }

    before do 
      travel_to(datetime)
    end

    it 'returns outdated movies' do
      expect(FindOutdatedMovies).to receive(:new).with(time)
      expect(FindOutdatedMovies.new(time).to receive(:call).and_return(movie))
      subject
    end
  end

end
