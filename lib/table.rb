# encoding: utf-8
require 'kosi'
require 'kosi/validators'
require 'unicode'

# TableFormat for Terminal(Use Japanese Charactors)
module Kosi
  # Table
  class Table
    attr_reader :align, :header, :connector_char, :horizontal_border_char,
                :vertical_border_char, :separate_each_row

    def initialize(options = {})
      @align = Kosi::Align.new(options)
      @header = Kosi::Header.new(options)
      @connector_char = Kosi::ConnectorChar.new(options)
      @horizontal_border_char = Kosi::HorizontalBorderChar.new(options)
      @vertical_border_char = Kosi::VerticalBorderChar.new(options)
      @separate_each_row = Kosi::SeparateEachRow.new(options)
    end

    def render(rows)
      check_rows_type(rows)
      check_each_array_length(rows)
      header = read_header
      escaped_rows = escape_ansi_escape_sequence(rows)
      max_lengths = get_max_lengths(escaped_rows, header)
      table_format_rows = get_table_format_rows(rows, max_lengths, header)
      table_format_rows.join("\n") + "\n"
    end

    private

    def check_rows_type(rows)
      Validators::RowType.validate(rows)
      rows.each { |row|Validators::RowType.validate(row) }
    end

    def check_each_array_length(rows)
      Validators::EachArrayLength.validate(rows)
    end

    def get_max_lengths(rows, header)
      tmp_rows = rows.dup
      tmp_rows << header unless @header.empty?
      tmp_rows.reduce([]) do |max_lengths, row|
        row.each_with_index do |e, i|
          s = ascii1_other2_size(String(e))
          next unless greater?(s, max_lengths[i])
          max_lengths[i] = s
        end
        max_lengths
      end
    end

    def greater?(one, other)
      return true if other.nil?
      one > other
    end

    def ascii1_other2_size(column)
      column.split('').reduce(0) do |a, e|
        a += Unicode.width(e)
        a
      end
    end

    def get_table_format_rows(rows, max_lengths, header)
      top_bottom_line = top_bottom(max_lengths)
      results = [top_bottom_line]
      append_header(results, header, max_lengths, top_bottom_line)
      rows.each do |col|
        results += formated_row(col, max_lengths, top_bottom_line)
      end
      results << top_bottom_line unless @separate_each_row.value
      results
    end

    def formated_row(col, max_lengths, top_bottom_line)
      results = []
      row_results = get_columns(col, max_lengths)
      virtical = @vertical_border_char.value
      results << "#{virtical}#{row_results.join(virtical)}#{virtical}"
      results << top_bottom_line if @separate_each_row.value
      results
    end

    def append_header(results, header, max_lengths, top_bottom_line)
      unless @header.empty?
        results << formated_header(header, max_lengths)
        results << top_bottom_line
      end
    end

    def top_bottom(max_lengths)
      results = max_lengths.reduce([]) do |ret, column_size|
        ret << @horizontal_border_char.value * column_size
        ret
      end
      con = @connector_char.value
      "#{con}#{results.join(con)}#{con}"
    end

    def read_header
      return nil if @header.empty?
      @header.value
    end

    def escape_ansi_escape_sequence(rows)
      rows.reduce([]) do |r, e|
        r << e.map do |f|f.to_s.gsub(/\x1b(\[|\(|\))[;?0-9]*[0-9A-Za-z]/, '')
            .gsub(/\x1b(\[|\(|\))[;?0-9]*[0-9A-Za-z]/, '')
            .gsub(/(\x03|\x1a)/, '')
        end
        r
      end
    end

    def formated_header(header, max_lengths)
      header_results = []
      header.size.times do |i|
        column = String(header[i])
        diff = ascii1_other2_size(column) - column.size
        header_results << @align.apply(column, max_lengths[i], diff)
      end
      virtical = @vertical_border_char.value
      header_line = header_results.join(virtical)
      "#{virtical}#{header_line}#{virtical}"
    end

    def get_columns(columns, max_lengths)
      column_results = []
      columns.size.times do |i|
        column = String(columns[i])
        diff = ascii1_other2_size(column) - column.size
        column_results << @align.apply(column, max_lengths[i], diff)
      end
      column_results
    end
  end
end
