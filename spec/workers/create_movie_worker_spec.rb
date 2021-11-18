# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CreateMovieWorker, type: :worker do
  describe '#perform' do
    subject { described_class.new.perform(title) }

    let(:title) { 'Batman' }

    before do
      allow(ImportMovie).to receive(:new).with(title)
    end

    it 'runs import movie service' do
      expect(ImportMovie.new(title)).to receive(:call)
      subject
    end
  end
end
