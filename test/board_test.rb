require 'minitest/autorun'
require 'chess/board'

class BoardTest < MiniTest::Unit::TestCase

  def setup
    @board = Chess::Board.new
  end

  def test_board_has_array_of_squares
    assert_instance_of Array, @board.squares
  end

  def test_board_has_eight_rows
    assert_equal 8, @board.squares.length
  end

  def test_board_has_eight_columns
    0.upto(7) do |column|
      assert_equal 8, @board.squares[column].length
    end
  end

  def test_set_piece_at_position
    rook = Chess::Pieces::Rook.new
    @board.set_piece_at(rook, 'c3')

    assert_equal rook, @board.piece_at('c3')
  end
end
