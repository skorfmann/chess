module Chess #:nodoc:
  module Pieces #:nodoc:
    class Piece

      VALID_COLORS = [:white, :black]

      attr_reader :color

      def initialize(color)
        raise ArgumentError unless VALID_COLORS.include?(color)

        @color = color
      end

      def black?
        color == :black
      end

      def white?
        !black?
      end
    end
  end
end
