# frozen_string_literal: true

require 'rails_helper'
RSpec.describe OmdbapiAdapter do
  describe '.find' do
    subject { described_class.find(title) }

    let(:title) { 'Batman' }

    before do
      travel_to(Time.zone.parse('2020-08-03 12:00:00'))
    end

    context 'with valid movie title' do
      it 'returns a hash with proper movie attributes' do
        VCR.use_cassette 'omdbapi_with_valid_title' do
          expect(subject[:title]).to eq 'Batman'
          expect(subject[:year]).to eq '1989'
          expect(subject[:rated]).to eq 'PG-13'
          expect(subject[:released]).to eq '23 Jun 1989'
          expect(subject[:runtime]).to eq '126 min'
          expect(subject[:genre]).to eq 'Action, Adventure'
          expect(subject[:director]).to eq 'Tim Burton'
          expect(subject[:writer]).to eq 'Bob Kane, Sam Hamm, Warren Skaaren'
        end
      end
    end

    context 'with invalid movie title' do
      let(:title) { 90_081 }

      it 'raises an error' do
        VCR.use_cassette 'omdbapi_with_invalid_title' do
          expect { subject }.to raise_error(Errors::MovieNotFoundError)
          expect(Errors::MovieNotFoundError.new(title).message).to eq('90081 not found! 12:00, 03/08/2020')
        end
      end
    end
  end
end
