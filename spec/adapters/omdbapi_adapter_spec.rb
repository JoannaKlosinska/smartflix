# frozen_string_literal: true

require 'rails_helper'
RSpec.describe OmdbapiAdapter do
  describe '.find' do
    subject { described_class.find('Batman') }

    it 'returns status code 200' do
      VCR.use_cassette('omdbapi', record: :new_episodes) do
        expect(subject.code).to eq(200)
      end
    end
  end
end
