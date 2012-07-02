module Chess #:nodoc:
  module Pieces #:nodoc:
    class Pawn < Piece

      def to_s
        black? ? "\u265F" : "\u2659"
      end
    end
  end
end
