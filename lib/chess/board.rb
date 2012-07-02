require 'active_support/all'
require_relative 'pieces'

module Chess #:nodoc:
  ##
  # This class represents a chess board and comes with an api to
  # handle the state of a game by querying, moving and resetting pieces.
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

    ##
    # Returns the piece located at specified position or nil, if the position
    # is blank.
    #
    # Raises an ArgumentError when the position is invalid.
    #
    # Example:
    #
    #   board = Chess::Board.new
    #   board.piece_at('a1') # -> piece
    #   board.piece_at('a5') # -> nil
    #   board.piece_at('z9') # -> raises ArgumentError
    def piece_at(position)
      coordinates_for(position) do |x, y|
        @squares[y][x]
      end
    end

    ##
    # Query a specified position if a any piece is present.Returns true or false.
    #
    # Raises an ArgumentError when the position is invalid.
    #
    # Example:
    #
    #   board = Chess::Board.new
    #   board.piece_at?('a1') # -> true
    #   board.piece_at?('a5') # -> false
    #   board.piece_at?('z9') # -> raises ArgumentError
    def piece_at?(position)
      !!piece_at(position)
    end

    ##
    # Moving a piece from one position to another. When a piece is present on
    # the new position, the piece will be removed and kept as a capture for future
    # reference. Returns the moved piece or nil, when the original position referenced
    # a blank square.
    #
    # There are no checks performed, if the intended move is allowed or possible.
    #
    # Raises an ArgumentError when one of the positions is invalid and the state
    # of the board remains unchanged.
    #
    # Example:
    #
    #   board = Chess::Board.new
    #   board.move_piece('a2', 'a4') # -> moved_piece
    #   board.move_piece('b3', 'b4') # -> nil
    #   board.move_piece('z9', 'b3') # -> raises ArgumentError
    #
    #   # captures
    #   board.move_piece('b2', 'b7') # -> moved_piece
    #   board.captures # -> [piece_from_b7]
    def move_piece(from, to)
      if piece = remove_piece_at(from)
        @captures << remove_piece_at(to) if piece_at?(to)
        set_piece_at(piece, to)
      end
    rescue ArgumentError => e
      set_piece_at(piece, from)
      raise e
    ensure
      to_s if defined?(IRB)
    end

    ##
    # Removes a piece from the specified position and returns the piece or nil,
    # if the specfied position is blank.
    #
    # Raises an ArgumentError when one of the positions is invalid and the state
    # of the board remains unchanged.
    #
    # Example:
    #
    #   board = Chess::Board.new
    #   board.remove_piece_at('a2') # -> removed_piece
    #   board.remove_piece_at('b3') # -> nil
    #   board.remove_piece_at('z9') # -> raises ArgumentError
    def remove_piece_at(position)
      piece_at(position).tap do
        set_piece_at nil, position
      end
    end

    ##
    # Reset the board for a new game.
    def reset_board
      @captures = []
      initialize_squares
      initialize_white_pieces
      initialize_black_pieces
    end

    ##
    # Print the state of the board as ASCII-Art
    def to_s
      @squares.reverse.each_with_index do |row, index|
        puts row.map {|i| i.nil? ? "\u00B7" : i.to_s }.unshift(BOARD_SIZE - index).join(' ')
      end
      puts '  ' + COLUMNS.to_a.join(' ')
      unless captures.blank?
        puts '-' * 20
        puts "Captures: #{captures.map(&:to_s) * ' '}"
      end
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
