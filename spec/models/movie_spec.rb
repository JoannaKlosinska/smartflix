# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Movie, type: :model do
  subject { described_class.new(title: title) }

  let(:title) { 'Star Wars' }

  context 'with correct attributes' do
    it 'is valid' do
      expect(subject).to be_valid
    end
  end

  context 'without a title' do
    let(:title) { '' }

    it 'is invalid' do
      expect(subject).not_to be_valid
    end
  end
end
