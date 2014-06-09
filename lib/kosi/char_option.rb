require 'kosi/options'

# TableFormat for Terminal(Use Japanese Charactors)
module Kosi
  # CharOption
  class CharOption
    attr_reader :value

    def initialize(options)
      @value = String(options[key])
      @value = default if @value.empty?
      unless @value.size == 1
        fail ArgumentError, format(invalid_char_msg, @value.size, @value)
      end
    end
  end
end
