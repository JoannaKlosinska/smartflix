# frozen_string_literal: true

VCR.configure do |config|
  config.cassette_library_dir = 'spec/cassettes'
  config.hook_into :webmock
  config.ignore_localhost = true
  config.default_cassette_options = { record: :once, match_requests_on: %i[body method] }
  config.filter_sensitive_data('apikey') { Rails.application.credentials.omdb[:api_key] }
end
