# frozen_string_literal: true
require 'kosi/options'

# TableFormat for Terminal(Use Japanese Charactors)
module Kosi
  # Header
  class Header
    attr_reader :value

    def initialize(options)
      @value = options[OptionKeys::HEADER]
    end

    def empty?
      @value.nil?
    end
  end
end
