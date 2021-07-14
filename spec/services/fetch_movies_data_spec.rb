# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FetchMoviesData do
  subject { described.class.new(title: title) }

  let(:title) { 'Star Wars' }
end
