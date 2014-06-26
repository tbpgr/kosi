# encoding: utf-8
require 'spec_helper'
require 'kosi/validators/row_type_validator'

describe Kosi::Validators::RowType do
  context :validate do
    cases = [
      {
        case_no: 1,
        case_title: 'Array case',
        inputs: ['Array'],
      },
      {
        case_no: 2,
        case_title: 'Not Array case',
        inputs: 'not Array',
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
            expect { Kosi::Validators::RowType.validate(c[:inputs]) }.to raise_error(c[:error_class])
            next
          else
            expect { Kosi::Validators::RowType.validate(c[:inputs]) }.not_to raise_error
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
