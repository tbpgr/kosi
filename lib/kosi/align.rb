# encoding: utf-8
require 'kosi/options'

# TableFormat for Terminal(Use Japanese Charactors)
module Kosi
  # Align
  class Align
    attr_reader :value
    # Align Type
    module TYPE
      CENTER = :center
      RIGHT = :right
      LEFT = :left
      DEFAULT = LEFT
    end

    def initialize(options)
      @value = options[OptionKeys::ALIGN] || TYPE::DEFAULT
    end

    def apply(text, max_value, diff)
      pos = max_value - diff
      case @value
      when TYPE::CENTER
        text.center(pos)
      when TYPE::RIGHT
        text.rjust(pos)
      when TYPE::LEFT
        text.ljust(pos)
      end
    end
  end
end
