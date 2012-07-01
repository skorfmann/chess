require 'minitest/autorun'

class TestCase < MiniTest::Unit::TestCase

  private

    def assert_piece_at(type, position)
      assert_instance_of "Chess::Pieces::#{type.to_s.camelize}".constantize, @board.piece_at(position)
    end
end
