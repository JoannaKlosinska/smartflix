# frozen_string_literal: true

require 'rails_helper'
RSpec.describe ImportMovie do
  describe '#class' do
    subject { described_class.new(title).call }

    let(:title) { 'Batman' }

    before do
      travel_to(Time.zone.parse('2020-08-03 12:00:00'))
    end

    context 'with valid title' do
      it 'creates a new movie' do
        VCR.use_cassette('omdbapi_with_valid_title', record: :new_episodes) do
          expect { subject }.to change(Movie, :count).by(1)
        end
      end
    end

    context 'when movie with specific title does not exist' do
      let(:title) { '90081' }

      it 'raises an error' do
        VCR.use_cassette('omdbapi_with_ivalid_title', record: :new_episodes) do
          expect(Rails.logger).to receive(:warn).with('Movie not found! 12:00, 03/08/2020')
          subject
        end
      end
    end
  end
end
