module Chess
  module Pieces
    class Piece

      VALID_COLORS = [:white, :black]

      attr_reader :color

      def initialize(color)
        raise ArgumentError unless VALID_COLORS.include?(color)

        @color = color
      end
    end
  end
end
