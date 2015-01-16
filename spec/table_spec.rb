# encoding: utf-8
require 'spec_helper'
require 'kosi'

describe Kosi::Table do
  context :initialize do
    cases = [
      {
        case_no: 1,
        case_title: 'no options case',
        options: nil,
        attr_name: '@align',
        expected: Kosi::Align::TYPE::LEFT
      },
      {
        case_no: 2,
        case_title: 'align options left case',
        options: { Kosi::OptionKeys::ALIGN => Kosi::Align::TYPE::RIGHT },
        attr_name: '@align',
        expected: Kosi::Align::TYPE::RIGHT
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          kosi_table = \
            if c[:options]
              Kosi::Table.new(c[:options])
            else
              Kosi::Table.new
            end

          # -- when --
          actual = kosi_table.instance_variable_get(c[:attr_name]).value

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

  context :render do
    cases = [
      {
        case_no: 1,
        case_title: 'valid case',
        options: nil,
        inputs: [[1, 2, 3], [1111, '２22アｱ', '３3イｲ']],
        expected: <<-EOS
+----+-------+------+
|1   |2      |3     |
|1111|２22アｱ|３3イｲ|
+----+-------+------+
        EOS
      },
      {
        case_no: 2,
        case_title: 'use header case',
        options: { header: %w(header1 header2 header3) },
        inputs: [[1, 2, 3], [1111, '２22アｱ', '３3イｲ']],
        expected: <<-EOS
+-------+-------+-------+
|header1|header2|header3|
+-------+-------+-------+
|1      |2      |3      |
|1111   |２22アｱ|３3イｲ |
+-------+-------+-------+
        EOS
      },
      {
        case_no: 3,
        case_title: 'Enable SeparateEachRow case',
        options: { separate_each_row: true },
        inputs: [[1, 2, 3], [1111, '２22アｱ', '３3イｲ'], [1, 2, 3]],
        expected: <<-EOS
+----+-------+------+
|1   |2      |3     |
+----+-------+------+
|1111|２22アｱ|３3イｲ|
+----+-------+------+
|1   |2      |3     |
+----+-------+------+
        EOS
      },
      {
        case_no: 4,
        case_title: 'use ANSI Escape sequence case',
        options: nil,
        inputs: [["\e[31mhello\e[0m"]],
        expected: <<-EOS
+-----+
|\e[31mhello\e[0m|
+-----+
        EOS
      },
      {
        case_no: 5,
        case_title: 'Unicode width case',
        options: nil,
        inputs: [['$100'], ['¥100']],
        expected: <<-EOS
+----+
|$100|
|¥100|
+----+
        EOS
      },
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          kosi_table = \
            if c[:options]
              Kosi::Table.new(c[:options])
            else
              Kosi::Table.new
            end

          # -- when --
          actual = kosi_table.render(c[:inputs])

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
