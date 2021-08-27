# frozen_string_literal: true

require 'rails_helper'
RSpec.describe OmdbapiAdapter do
  describe '.find' do
    subject { described_class.find('Batman') }

    it 'returns status code 200' do
      VCR.use_cassette('omdbapi_with_valid_title', record: :new_episodes) do
        expect(subject[:title]).to eq('Batman')
      end
    end
  end
end
