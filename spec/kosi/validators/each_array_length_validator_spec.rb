# encoding: utf-8
require 'spec_helper'
require 'kosi/validators/each_array_length_validator'

describe Kosi::Validators::EachArrayLength do
  context :validate do
    cases = [
      {
        case_no: 1,
        case_title: 'Same Length Array case',
        inputs: [[*1..5], [*6..10]],
      },
      {
        case_no: 2,
        case_title: 'Zero Length Array case',
        inputs: [[], []],
      },
      {
        case_no: 3,
        case_title: 'Different Length Array case',
        inputs: [[*1..5], [*6..11]],
        expect_error: true,
        error_class: ArgumentError
      },
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          # nothing

          # -- when/then --
          if c[:expect_error]
            expect { Kosi::Validators::EachArrayLength.validate(c[:inputs]) }.to raise_error(c[:error_class])
            next
          else
            expect { Kosi::Validators::EachArrayLength.validate(c[:inputs]) }.not_to raise_error
          end
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
