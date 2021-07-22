# frozen_string_literal: true

require 'rails_helper'
require 'sidekiq/testing'
RSpec.describe CreateMovieWorker, type: :worker do
  subject { described_class.perform_async('Batman') }

  Sidekiq::Testing.inline!


  it 'creates new movie' do
    VCR.use_cassette 'omdbapi' do
      expect { subject }.to change(Movie, :count).by(1)
    end
  end

end
