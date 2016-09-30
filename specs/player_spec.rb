require ('minitest/autorun')
require ('minitest/rg')
require_relative ('../player')
require_relative ('../throw')

class TestPlayer < Minitest::Test

  def test_player_name_is_set
    player = Player.new('Phil', 100)
    assert_equal('Phil', player.name)
  end

  def test_player_score_is_set
    player = Player.new('Phil', 100)
    assert_equal(100, player.current_score)
  end

  def test_player_sets_won_is_zero
    player = Player.new('Phil', 100)
    assert_equal(0, player.sets_won)
  end

  def test_player_legs_won_is_zero
    player = Player.new('Phil', 100)
    assert_equal(0, player.legs_won)
  end

  def test_player_throw_updates_score
    player = Player.new('Phil', 501)
    player_throw = Throw.new(180)
    player.throw_darts(player_throw)
    assert_equal(321, player.current_score)
  end

  def test_player_is_bust_when_throw_greater_than_current_score
    player = Player.new('Phil', 100)
    player_throw = Throw.new(120)
    assert_equal(true, player.is_bust?(player_throw))
  end

  def test_player_is_bust_when_throw_is_one_less_than_current_score
    player = Player.new('Phil', 100)
    player_throw = Throw.new(99)
    assert_equal(true, player.is_bust?(player_throw))
  end

  def test_player_score_does_not_change_when_busted
    player = Player.new('Phil', 100)
    player_throw = Throw.new(120)
    player.throw_darts(player_throw)
    assert_equal(100, player.current_score)
  end

  def test_player_throws_winning_score
    player = Player.new('Phil', 100)
    player_throw = Throw.new(100)
    assert_equal(true,player.is_winning_throw?(player_throw))
  end

  def test_player_throws_winning_score_results_in_zero_score
    player = Player.new('Phil', 100)
    player_throw = Throw.new(100)
    assert_equal(true,player.is_winning_throw?(player_throw))
    player.throw_darts(player_throw)
    assert_equal(0,player.current_score)
  end

  def test_player_does_not_throw_winning_score
    player = Player.new('Phil', 100)
    player_throw = Throw.new(80)
    assert_equal(false ,player.is_winning_throw?(player_throw))
    player.throw_darts(player_throw)
    assert_equal(20,player.current_score)
  end

  def test_100_is_a_finish
    player = Player.new('Phil', 100)
    assert_equal(true, player.is_on_a_finish?())
  end

  def test_180_is_not_a_finish
    player = Player.new('Phil', 180)
    assert_equal(false, player.is_on_a_finish?())
  end

  def test_170_is_a_finish
    player = Player.new('Phil', 170)
    assert_equal(true, player.is_on_a_finish?())
  end

  def test_167_is_a_finish
    player = Player.new('Phil', 167)
    assert_equal(true, player.is_on_a_finish?())
  end

  def test_164_is_a_finish
    player = Player.new('Phil', 164)
    assert_equal(true, player.is_on_a_finish?())
  end

  def test_161_is_a_finish
    player = Player.new('Phil', 161)
    assert_equal(true, player.is_on_a_finish?())
  end

  def test_160_is_a_finish
    player = Player.new('Phil', 160)
    assert_equal(true, player.is_on_a_finish?())
  end

  def test_159_is_not_a_finish
    player = Player.new('Phil', 159)
    assert_equal(false, player.is_on_a_finish?())
  end

  def test_162_is_not_a_finish
    player = Player.new('Phil', 162)
    assert_equal(false, player.is_on_a_finish?())
  end

  def test_171_is_not_a_finish
    player = Player.new('Phil', 171)
    assert_equal(false, player.is_on_a_finish?())
  end

end