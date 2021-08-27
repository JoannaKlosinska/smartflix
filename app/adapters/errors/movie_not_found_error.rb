# frozen_string_literal: true

module Errors
  class MovieNotFoundError < StandardError

    def initialize(title)
      @title = title
      @time = Time.zone.now
    end

    def message
      "#{title} not found! #{time.strftime('%k:%M')}, #{time.strftime('%d/%m/%Y')}"
    end

    private

    attr_reader :title, :time

  end
end
