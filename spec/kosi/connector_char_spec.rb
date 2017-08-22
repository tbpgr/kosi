require 'spec_helper'
require 'kosi'

describe Kosi::ConnectorChar do
  context :value do
    cases = [
      {
        case_no: 1,
        case_title: 'no options case',
        options: {},
        expected: Kosi::ConnectorChar::DEFAULT
      },
      {
        case_no: 2,
        case_title: 'valid connector char options case',
        options: { Kosi::OptionKeys::CONNECTOR_CHAR => '@' },
        expected: '@'
      },
      {
        case_no: 3,
        case_title: 'invalid connector char options case',
        options: { Kosi::OptionKeys::CONNECTOR_CHAR => '++' },
        expect_error: true
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          if c[:expect_error]
            expect { Kosi::ConnectorChar.new(c[:options]) }
              .to raise_error(ArgumentError)
            next
          end
          connector_char = Kosi::ConnectorChar.new(c[:options])

          # -- when --
          actual = connector_char.value

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
