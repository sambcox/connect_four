require './lib/cell'

class Board
  attr_reader :columns
  def initialize
    @columns = {
      "A" => [],
      "B" => [],
      "C" => [],
      "D" => [],
      "E" => [],
      "F" => [],
      "G" => []
    }

      @columns.each do |column, row|
      6.times{ row << Cell.new}
      end
    end

  # def find_empty_space(column_inputted)
  #   columns.find do |column, row|
  #     column_inputted.downcase == column.downcase && row.empty?
  #   end
  #   add_piece
  # end


  def place_piece(column_inputted)
    if columns[column_inputted.upcase][5].empty? == false
      puts "That column is full! Please select another."
      place_piece(gets.chomp)
    else
      columns.find do |column, row|
        if column_inputted.downcase == column.downcase
          row.find do |cell|
            if cell.empty?
              cell.add_piece
            end
          end
        end
      end
    end
  end
end
