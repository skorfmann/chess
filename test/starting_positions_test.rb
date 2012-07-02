require_relative 'test_helper'
require 'chess/board'

class StartPositionTest < TestCase

  def setup
    @board = Chess::Board.new
  end

  def test_start_positions_white
    assert_piece_at @board, :rook, 'a1'
    assert_piece_at @board, :knight, 'b1'
    assert_piece_at @board, :bishop, 'c1'
    assert_piece_at @board, :queen, 'd1'
    assert_piece_at @board, :king, 'e1'
    assert_piece_at @board, :bishop, 'f1'
    assert_piece_at @board, :knight, 'g1'
    assert_piece_at @board, :rook, 'h1'
  end

  def test_pawn_start_positions_white
    assert_piece_at @board, :pawn, 'a2'
    assert_piece_at @board, :pawn, 'b2'
    assert_piece_at @board, :pawn, 'c2'
    assert_piece_at @board, :pawn, 'd2'
    assert_piece_at @board, :pawn, 'e2'
    assert_piece_at @board, :pawn, 'f2'
    assert_piece_at @board, :pawn, 'g2'
    assert_piece_at @board, :pawn, 'h2'
  end

  def test_start_positions_black
    assert_piece_at @board, :rook, 'a8'
    assert_piece_at @board, :knight, 'b8'
    assert_piece_at @board, :bishop, 'c8'
    assert_piece_at @board, :queen, 'd8'
    assert_piece_at @board, :king, 'e8'
    assert_piece_at @board, :bishop, 'f8'
    assert_piece_at @board, :knight, 'g8'
    assert_piece_at @board, :rook, 'h8'
  end

  def test_pawn_start_positions_black
    assert_piece_at @board, :pawn, 'a7'
    assert_piece_at @board, :pawn, 'b7'
    assert_piece_at @board, :pawn, 'c7'
    assert_piece_at @board, :pawn, 'd7'
    assert_piece_at @board, :pawn, 'e7'
    assert_piece_at @board, :pawn, 'f7'
    assert_piece_at @board, :pawn, 'g7'
    assert_piece_at @board, :pawn, 'h7'
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
end
