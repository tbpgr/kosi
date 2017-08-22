require 'spec_helper'
require 'kosi'

describe Kosi::VerticalBorderChar do
  context :value do
    cases = [
      {
        case_no: 1,
        case_title: 'no options case',
        options: {},
        expected: Kosi::VerticalBorderChar::DEFAULT
      },
      {
        case_no: 2,
        case_title: 'valid vertical_border_char options case',
        options: { Kosi::OptionKeys::VERTICAL_BORDER_CHAR => '@' },
        expected: '@'
      },
      {
        case_no: 3,
        case_title: 'invalid vertical_border_char options case',
        options: { Kosi::OptionKeys::VERTICAL_BORDER_CHAR => '||' },
        expect_error: true
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          if c[:expect_error]
            expect { Kosi::VerticalBorderChar.new(c[:options]) }
              .to raise_error(ArgumentError)
            next
          end
          vertical_border_char = Kosi::VerticalBorderChar.new(c[:options])

          # -- when --
          actual = vertical_border_char.value

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
