require 'minitest/autorun'
require 'chess/pieces/piece'

class PieceTest < MiniTest::Unit::TestCase

  def setup
    @piece = Chess::Pieces::Piece.new
  end

  def test_piece_is_initializable
    assert @piece
  end
end
