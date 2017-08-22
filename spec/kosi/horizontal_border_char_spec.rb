require 'spec_helper'
require 'kosi'

describe Kosi::HorizontalBorderChar do
  context :value do
    cases = [
      {
        case_no: 1,
        case_title: 'no options case',
        options: {},
        expected: Kosi::HorizontalBorderChar::DEFAULT
      },
      {
        case_no: 2,
        case_title: 'valid horizontal_border_char options case',
        options: { Kosi::OptionKeys::HORIZONTAL_BORDER_CHAR => '@' },
        expected: '@'
      },
      {
        case_no: 3,
        case_title: 'invalid horizontal_border_char options case',
        options: { Kosi::OptionKeys::HORIZONTAL_BORDER_CHAR => '--' },
        expect_error: true
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          if c[:expect_error]
            expect { Kosi::HorizontalBorderChar.new(c[:options]) }
              .to raise_error(ArgumentError)
            next
          end
          horizontal_border_char = Kosi::HorizontalBorderChar.new(c[:options])

          # -- when --
          actual = horizontal_border_char.value

          # -- then --
          expect(actual).to eq(c[:expected])
        ensure
          case_after c
        end
      end

      def case_before(c)
        # implement each case before
      end

      def case_after(c)
        # implement each case after
      end
    end
  end
end
