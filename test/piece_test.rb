require 'minitest/autorun'
require 'chess/pieces/piece'

class PieceTest < MiniTest::Unit::TestCase

  def test_piece_is_initializable_with_white
    piece = Chess::Pieces::Piece.new(:white)

    assert_equal piece.color, :white
  end

  def test_piece_is_initializable_with_black
    piece = Chess::Pieces::Piece.new(:black)

    assert_equal piece.color, :black
  end

  def test_piece_is_not_initializable_with_other_argument
    assert_raises ArgumentError do
      Chess::Pieces::Piece.new(:pink)
    end
  end
end
