require_relative 'test_helper'
require 'chess/pieces/piece'

class PieceTest < TestCase

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

  def test_piece_is_black?
    piece = Chess::Pieces::Piece.new(:black)

    assert piece.black?
    assert !piece.white?
  end

  def test_piece_is_white?
    piece = Chess::Pieces::Piece.new(:white)

    assert piece.white?
    assert !piece.black?
  end
end
