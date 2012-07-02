module Chess #:nodoc:
  module Pieces #:nodoc:
    class Queen < Piece

      def to_s
        black? ? "\u265B" : "\u2655"
      end
    end
  end
end
