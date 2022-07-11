# frozen_string_literal: true

require 'rails_helper'
RSpec.describe FindOutdatedMovies do
  describe '#call' do
    subject { described_class.new(time).call }

    let(:time) { 48.hours }
    let(:datetime) { Time.zone.parse('2020-08-03 12:00:00') }
    let(:first_movie) { create(:movie, updated_at: datetime - 24.hours) }
    let(:second_movie) { create(:movie, updated_at: datetime - 48.hours) }
    let(:third_movie) { create(:movie, updated_at: datetime - 48.hours - 1.second) }

    before do
      travel_to(datetime)
    end

    it 'returns movies with outdated' do
      expect(subject).to match([third_movie])
    end
  end
end
