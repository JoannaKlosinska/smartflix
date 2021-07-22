# frozen_string_literal: true

require 'rails_helper'
RSpec.describe MoviesController, type: :request do
  describe 'GET #show' do
    before do
      create(:movie, title: 'Batman', year: 1989)
    end

    context 'when movie exists' do
      before { get('/movies/Batman') }

      it 'returns status code :ok' do
        expect(response).to have_http_status(:ok)
      end

      it 'has a proper content' do
        parsed_response = JSON.parse(response.body)
        expect(parsed_response).to include('title' => 'Batman')
        expect(parsed_response).to include('year' => 1989)
      end
    end

    # context 'when movie does not exist' do

    #   before { get('movies/Star Wars') }

    #   it 'returns status code 404' do
    #     expect(response).to have_http_status(:not_found)
    #   end

    #   it 'runs a worker' do
    #     expect(CreateMovieWorker).to receive(:perform_async)
    #   end
    # end
  end
end
