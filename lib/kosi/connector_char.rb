require 'kosi/options'
require 'kosi/char_option'

# TableFormat for Terminal(Use Japanese Charactors)
module Kosi
  # ConnectorChar
  class ConnectorChar < CharOption
    DEFAULT = '+'
    INVALID_CHAR_MSG = \
        'connector char must be 1 length(%d) char %s'

    def default
      DEFAULT
    end

    def key
      OptionKeys::CONNECTOR_CHAR
    end

    private

    def invalid_char_msg
      INVALID_CHAR_MSG
    end
  end
end
