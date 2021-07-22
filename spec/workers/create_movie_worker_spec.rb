# frozen_string_literal: true

require 'rails_helper'
require 'sidekiq/testing'
RSpec.describe CreateMovieWorker, type: :worker do
  Sidekiq::Testing.inline!
end
