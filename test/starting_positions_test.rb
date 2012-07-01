require 'minitest/autorun'
require 'chess/board'

class StartPositionTest < MiniTest::Unit::TestCase

  PIECES = %w(rook knight bishop queen king bishop knight rook)

  def setup
    @board = Chess::Board.new
  end

  def test_start_positions_white
    assert_piece_at :rook, 'a1'
    assert_piece_at :knight, 'b1'
    assert_piece_at :bishop, 'c1'
    assert_piece_at :queen, 'd1'
    assert_piece_at :king, 'e1'
    assert_piece_at :bishop, 'f1'
    assert_piece_at :knight, 'g1'
    assert_piece_at :rook, 'h1'
  end

  def test_start_positions_black
    assert_piece_at :rook, 'a8'
    assert_piece_at :knight, 'b8'
    assert_piece_at :bishop, 'c8'
    assert_piece_at :queen, 'd8'
    assert_piece_at :king, 'e8'
    assert_piece_at :bishop, 'f8'
    assert_piece_at :knight, 'g8'
    assert_piece_at :rook, 'h8'
  end

  private
    def assert_piece_at(type, position)
      assert_instance_of "Chess::Pieces::#{type.to_s.camelize}".constantize, @board.piece_at(position)
    end
end
