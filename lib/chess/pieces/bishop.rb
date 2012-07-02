module Chess #:nodoc:
  module Pieces #:nodoc:
    class Bishop < Piece

      def to_s
        black? ? "\u265D" : "\u2657"
      end
    end
  end
end
