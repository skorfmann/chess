require 'pp'
require 'active_support/all'
require_relative 'pieces'

module Chess
  class Board

    BOARD_SIZE = 8
    COLUMNS = 'a'..'h'
    ASCII_CODE_A = 97
    VALID_POSITION_REGEX = /^[abcdefgh][12345678]$/
    START_ORDER = [
      %w(rook knight bishop queen king bishop knight rook),
      BOARD_SIZE.times.map { 'pawn' }
    ]

    attr_reader :squares, :captures

    def initialize
      reset_board
    end

    def piece_at(position)
      coordinates_for(position) do |x, y|
        @squares[y][x]
      end
    end

    def piece_at?(position)
      !!piece_at(position)
    end

    def move_piece(from, to)
      if piece = remove_piece_at(from)
        @captures << remove_piece_at(to) if piece_at?(to)
        set_piece_at(piece, to)
      end
    rescue ArgumentError => e
      set_piece_at(piece, from)
      raise e
    end

    def remove_piece_at(position)
      piece_at(position).tap do
        set_piece_at nil, position
      end
    end

    def reset_board
      @captures = []
      initialize_squares
      initialize_white_pieces
      initialize_black_pieces
    end

    private

      def set_piece_at(piece, position)
        coordinates_for(position) do |x, y|
          @squares[y][x] = piece
        end
      end

      def initialize_squares
        @squares = Array.new(BOARD_SIZE) { Array.new(BOARD_SIZE) }
      end

      def initialize_white_pieces
        START_ORDER.each_with_index do |row, index|
          build_row(row, index, :white)
        end
      end

      def initialize_black_pieces
        offset = 6
        START_ORDER.reverse.each_with_index do |row, index|
          build_row(row, index + offset, :black)
        end
      end

      def build_row(row, index, color)
        row.zip(columns_for_row(index)).each do |piece_type, position|
          set_piece_at(build_piece(piece_type, color), position)
        end
      end

      def coordinates_for(position)
        raise ArgumentError unless valid_position?(position)

        yield char_to_coordinate(position[0]), position[1].to_i - 1
      end

      def char_to_coordinate(char)
        char.ord - ASCII_CODE_A
      end

      def build_piece(piece_type, color)
        "Chess::Pieces::#{piece_type.to_s.camelize}".constantize.new(color)
      end

      def columns_for_row(row_index)
        COLUMNS.map {|column| column + (row_index + 1).to_s}
      end

      def valid_position?(position)
        position =~ VALID_POSITION_REGEX
      end
  end
end
