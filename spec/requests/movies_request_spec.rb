# frozen_string_literal: true

require 'rails_helper'
RSpec.describe MoviesController, type: :request do
  describe 'GET #show' do
    before { create(:movie) }

    context 'when movie exists' do
      before { get('/movies/Batman') }

      it 'returns status code :ok' do
        expect(response).to have_http_status(:ok)
      end
    end

    context 'when movie does not exist' do
      before do
        expect(CreateMovieWorker).to receive(:perform_async).with('Star Wars')
        get('/movies/Star%20Wars')
      end

      it 'returns a status code 404 and runs a specific worker' do
        expect(response).to have_http_status(:not_found)
        expect(response.body).to eq 'not found, try again later'
      end
    end
  end
end
