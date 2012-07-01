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
    rook = Chess::Pieces::Rook.new(:white)
    @board.set_piece_at(rook, 'c3')

    assert_equal rook, @board.squares[2][2]
  end

  def test_get_piece_at_position
    rook = Chess::Pieces::Rook.new(:white)
    @board.squares[2][2] = rook

    assert_equal rook, @board.piece_at('c3')
  end

  def test_get_piece_at_from_blank_square
    assert_nil @board.piece_at('c3')
  end

  def test_get_piece_at_position_out_of_range_x
    assert_raises ArgumentError do
      @board.piece_at('i4')
    end
  end

  def test_get_piece_at_position_out_of_range_y
    assert_raises ArgumentError do
      @board.piece_at('i9')
    end
  end

  def test_get_piece_at_position_crappy_input
    assert_raises ArgumentError do
      @board.piece_at('gw')
    end
  end
end
