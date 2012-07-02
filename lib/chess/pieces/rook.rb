module Chess #:nodoc:
  module Pieces #:nodoc:
    class Rook < Piece

      def to_s
        black? ? "\u265C" : "\u2656"
      end
    end
  end
end
