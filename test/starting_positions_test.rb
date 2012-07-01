require 'minitest/autorun'
require 'chess/board'

class StartPositionTest < MiniTest::Unit::TestCase

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

  def test_pawn_start_positions_white
    assert_piece_at :pawn, 'a2'
    assert_piece_at :pawn, 'b2'
    assert_piece_at :pawn, 'c2'
    assert_piece_at :pawn, 'd2'
    assert_piece_at :pawn, 'e2'
    assert_piece_at :pawn, 'f2'
    assert_piece_at :pawn, 'g2'
    assert_piece_at :pawn, 'h2'
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

  def test_pawn_start_positions_black
    assert_piece_at :pawn, 'a7'
    assert_piece_at :pawn, 'b7'
    assert_piece_at :pawn, 'c7'
    assert_piece_at :pawn, 'd7'
    assert_piece_at :pawn, 'e7'
    assert_piece_at :pawn, 'f7'
    assert_piece_at :pawn, 'g7'
    assert_piece_at :pawn, 'h7'
  end

  def test_middle_rows_should_be_emtpy
    @board.squares[2..5].each do |row|
      row.each {|square| assert_nil square }
    end
  end

  def test_pieces_are_white
    @board.squares[0..1].each do |row|
      assert row.all? {|piece| piece.color == :white }
    end
  end

  def test_pieces_are_black
    @board.squares[6..7].each do |row|
      assert row.all? {|piece| piece.color == :black }
    end
  end

  private
    def assert_piece_at(type, position)
      assert_instance_of "Chess::Pieces::#{type.to_s.camelize}".constantize, @board.piece_at(position)
    end
end
