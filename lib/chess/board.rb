require 'pp'
require 'active_support/all'
require_relative 'pieces'

module Chess
  class Board

    BOARD_SIZE = 8
    START_ORDER = %w(rook knight bishop queen king bishop knight rook)

    attr_reader :squares

    def initialize
      @squares = Array.new(BOARD_SIZE) { Array.new(BOARD_SIZE) }
      [0, BOARD_SIZE - 1].each do |row|
        @squares[row] = START_ORDER.map do |piece_type|
          "Chess::Pieces::#{piece_type.camelize}".constantize.new
        end
      end
    end

    def set_piece_at(piece, position)
      coordinates_for(position) do |x, y|
        @squares[x][y] = piece
      end
    end

    def piece_at(position)
      coordinates_for(position) do |x, y|
        @squares[x][y]
      end
    end

    def move_piece(form, to)
    end

    def remove_piece_at(position)
    end

    private

      def coordinates_for(position)
        chars = position.split
        yield chars[1].to_i - 0, chars[0].ord - 97
      end
  end
end
