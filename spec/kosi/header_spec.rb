# encoding: utf-8
require 'spec_helper'
require 'kosi'

describe Kosi::Header do
  context :value do
    cases = [
      {
        case_no: 1,
        case_title: 'no options case',
        options: {},
        expected: nil
      },
      {
        case_no: 2,
        case_title: 'align options left case',
        options: { Kosi::OptionKeys::HEADER => %w(header1 header2) },
        expected: %w(header1 header2)
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          header = Kosi::Header.new(c[:options])

          # -- when --
          actual = header.value

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

  context :empty? do
    cases = [
      {
        case_no: 1,
        case_title: 'no options case',
        options: {},
        expected: true
      },
      {
        case_no: 2,
        case_title: 'align options left case',
        options: { Kosi::OptionKeys::HEADER => %w(header1 header2) },
        expected: false
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          header = Kosi::Header.new(c[:options])

          # -- when --
          actual = header.empty?

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
