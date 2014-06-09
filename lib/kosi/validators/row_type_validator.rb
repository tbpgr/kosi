# encoding: utf-8

# Kosi
module Kosi
  # Validators
  module Validators
    # RowType Validator
    # if row class is not Array, fail ArgumentError.
    class RowType
      INVALID_ROW_MESSAGE = 'invalid row class %s. row class must be Array.'
      def self.validate(row)
        unless row.is_a?(Array)
          message = format(INVALID_ROW_MESSAGE, row.class)
          fail ArgumentError, message
        end
      end
    end
  end
end
