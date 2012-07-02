module Chess #:nodoc:
  module Pieces #:nodoc:
    class Knight < Piece

      def to_s
        black? ? "\u265E" : "\u2658"
      end
    end
  end
end
