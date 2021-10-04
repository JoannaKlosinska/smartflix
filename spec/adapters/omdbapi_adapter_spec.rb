# frozen_string_literal: true

require 'rails_helper'
RSpec.describe OmdbapiAdapter do
  describe '.find' do
    subject { described_class.find(title) }

    let(:title) { 'Batman' }

    before do
      travel_to(Time.zone.parse('2020-08-03 12:00:00'))
    end

    context 'when title is valid' do
      it 'returns status code 200' do
        VCR.use_cassette('omdbapi_with_valid_title', record: :new_episodes) do
          expect(subject[:title]).to eq(title)
        end
      end
    end

    context 'when title is invalid' do
      let(:title) { 90_081 }

      it 'raise an error' do
        VCR.use_cassette('omdbapi_with_invalid_title', record: :new_episodes) do
          expect { subject }.to raise_error(Errors::MovieNotFoundError)
          expect(Errors::MovieNotFoundError.new(title).message).to eq('90081 not found! 12:00, 03/08/2020')
        end
      end
    end
  end
end
