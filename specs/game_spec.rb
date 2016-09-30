require ('minitest/autorun')
require ('minitest/rg')
require_relative ('../game')
require_relative ('../player')

class TestGame < Minitest::Test
  def setup
    @player1 = Player.new("Jack", 501)
    @player2 = Player.new("Victor", 501)

    @players = [@player1, @player2]
  end

  def test_game_start_score_is_set
    game = Game.new(701,@players,3,5)
    assert_equal(701, game.start_score)
  end

  def test_game_thrower_player_1
    game = Game.new(501, @players,3,5)
    assert_equal(@player1, game.thrower)
  end

  def test_switch_thrower_to_player2
    game = Game.new(501, @players,3,5)
    game.switch_thrower()
    assert_equal(@player2, game.thrower)
  end

  def test_game_won_false
    game = Game.new(501, @players,3,5)
    assert_equal(false, game.won?())
  end

  def test_game_won_true
    game = Game.new(501, @players,3,5)
    game.player1.current_score = 0
    assert_equal(true, game.won?())
  end

end