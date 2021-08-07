# frozen_string_literal: true

require 'rails_helper'
require 'sidekiq/testing'
RSpec.describe CreateMovieWorker, type: :worker do
  subject { described_class.perform_async('Batman') }

  let(:service) { double(ImportMovie) }

  Sidekiq::Testing.inline!

  it 'runs import movie service' do
    allow(ImportMovie).to receive(:new).with('Batman').and_return(service)
    expect(ImportMovie.new('Batman')).to receive(:call)
    subject
  end

  it 'creates new movie' do
    VCR.use_cassette('omdbapi_with_valid_title', record: :new_episodes) do
      expect { subject }.to change(Movie, :count).by(1)
    end
  end
end
