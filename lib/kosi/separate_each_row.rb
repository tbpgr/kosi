# frozen_string_literal: true
require 'kosi/options'

# TableFormat for Terminal(Use Japanese Characters)
module Kosi
  # SeparateEachRow
  class SeparateEachRow
    attr_reader :value
    DEFAULT = false

    def initialize(options)
      @value = options[OptionKeys::SEPARATE_EACH_ROW] || DEFAULT
    end
  end
end
