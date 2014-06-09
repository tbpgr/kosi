# encoding: utf-8

# Kosi
module Kosi
  # Validators
  module Validators
    # EachArrayLength Validator
    # if row class is not Array, fail ArgumentError.
    class EachArrayLength
      INVALID_ARRAY_LENGTH_MESSAGE = \
          'invalid array length.each array must be same length'
      def self.validate(row)
        row_sizes = row.map(&:size)
        return if row_sizes.uniq.size == 0
        unless row_sizes.uniq.size == 1
          fail ArgumentError, INVALID_ARRAY_LENGTH_MESSAGE
        end
      end
    end
  end
end
