# frozen_string_literal: true

require 'rails_helper'
RSpec.describe ImportMovie do
  describe '#class' do
    subject { described_class.new(title).call }

    let(:title) { 'Batman' }

    context 'with valid title' do
      it 'creates a new movie' do
        expect { subject }.to change(Movie, :count).by(1)
      end
    end

    context 'when title is blank' do
      let(:title) { '' }

      it 'raises an error' do
        expect { subject }.to raise_error(ActiveRecord::RecordInvalid)
      end
    end
  end
end
