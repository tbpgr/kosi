# encoding: utf-8
require 'spec_helper'
require 'kosi'

describe Kosi::Align do
  context :apply do
    cases = [
      {
        case_no: 1,
        case_title: 'no options case',
        options: {},
        text: 'h',
        max_value: 3,
        diff: 0,
        expected_option: Kosi::Align::TYPE::LEFT,
        expected: 'h  '
      },
      {
        case_no: 2,
        case_title: 'align options right case',
        options: { Kosi::OptionKeys::ALIGN => Kosi::Align::TYPE::RIGHT },
        text: 'h',
        max_value: 3,
        diff: 0,
        expected_option: Kosi::Align::TYPE::RIGHT,
        expected: '  h'
      },
      {
        case_no: 3,
        case_title: 'align options left case',
        options: { Kosi::OptionKeys::ALIGN => Kosi::Align::TYPE::LEFT },
        text: 'h',
        max_value: 3,
        diff: 0,
        expected_option: Kosi::Align::TYPE::LEFT,
        expected: 'h  '
      },
      {
        case_no: 4,
        case_title: 'align options center case',
        options: { Kosi::OptionKeys::ALIGN => Kosi::Align::TYPE::CENTER },
        text: 'h',
        max_value: 3,
        diff: 0,
        expected_option: Kosi::Align::TYPE::CENTER,
        expected: ' h '
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          header = Kosi::Align.new(c[:options])

          # -- when --
          actual = header.apply(c[:text], c[:max_value], c[:diff])

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
