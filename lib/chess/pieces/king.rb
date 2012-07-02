module Chess #:nodoc:
  module Pieces #:nodoc:
    class King < Piece

      def to_s
        black? ? "\u265A" : "\u2654"
      end
    end
  end
end
