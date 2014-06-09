# encoding: utf-8
require 'spec_helper'
require 'kosi'

describe Kosi::SeparateEachRow do
  context :value do
    cases = [
      {
        case_no: 1,
        case_title: 'no options case',
        options: {},
        expected: Kosi::SeparateEachRow::DEFAULT
      },
      {
        case_no: 2,
        case_title: 'seprate_each_row options true case',
        options: { Kosi::OptionKeys::SEPARATE_EACH_ROW => true },
        expected: true
      },
      {
        case_no: 3,
        case_title: 'seprate_each_row options false case',
        options: { Kosi::OptionKeys::SEPARATE_EACH_ROW => false },
        expected: false
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          separate_each_row = Kosi::SeparateEachRow.new(c[:options])

          # -- when --
          actual = separate_each_row.value

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
