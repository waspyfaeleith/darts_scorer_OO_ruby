require ('minitest/autorun')
require ('minitest/rg')
require_relative ('../throw')

class TestThrow < Minitest::Test

  def test_score_is_set
    t = Throw.new(180)
    assert_equal(180, t.score)
  end

  def test_180_is_valid_throw
    t = Throw.new(180)
    assert_equal(true, t.is_valid?())
  end

  def test_181_is_invalid_throw
    t = Throw.new(181)
    assert_equal(false, t.is_valid?())
  end

  def test_100_is_valid_throw
    t = Throw.new(100)
    assert_equal(true, t.is_valid?())
  end

  def test_0_is_valid_throw
    t = Throw.new(0)
    assert_equal(true, t.is_valid?())
  end

  def test_163_is_invalid_throw
    t = Throw.new(163)
    assert_equal(false, t.is_valid?())
  end

  def test_164_is_valid_throw
    t = Throw.new(164)
    assert_equal(true, t.is_valid?())
  end
end