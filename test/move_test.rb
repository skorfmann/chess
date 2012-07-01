require_relative 'test_helper'
require 'chess/board'

class MoveTest < TestCase

  def setup
    @board = Chess::Board.new
  end

  def test_move_piece_to_new_position
    assert_piece_at :pawn, 'a2'
    assert_nil @board.piece_at('a4')

    @board.move_piece 'a2', 'a4'

    assert_piece_at :pawn, 'a4'
    assert_nil @board.piece_at('a2')
  end

  def test_not_move_with_invalid_position
    assert_raises ArgumentError do
      @board.move_piece 'a2', 'i4'
    end

    assert_piece_at :pawn, 'a2'
  end

  def test_not_move_with_other_invalid_position
    assert_raises ArgumentError do
      @board.move_piece 'i2', 'a4'
    end
  end

  def test_should_handle_blank_square
    assert_piece_at :pawn, 'a7'
    assert_nil @board.piece_at('a3')

    assert !@board.move_piece('a3', 'a7')

    assert_piece_at :pawn, 'a7'
    assert_nil @board.piece_at('a3')
    assert_equal [], @board.captures
  end

  def test_capture_other_piece
    piece = @board.piece_at('a2')
    piece_to_capture = @board.piece_at('a7')

    @board.move_piece 'a2', 'a7'

    assert_equal piece, @board.piece_at('a7')
    assert_equal [piece_to_capture], @board.captures
  end

  private

    def move_piece(type, from, to)
      assert_piece_at :pawn, 'a2'
      assert_nil @board.piece_at('a4')

      assert_piece_at :pawn, 'a4'
      assert_nil @board.piece_at('a2')
    end
end
