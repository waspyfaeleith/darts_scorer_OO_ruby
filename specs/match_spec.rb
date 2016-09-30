require ('minitest/autorun')
require ('minitest/rg')
require_relative ('../match')

class TestMatch < Minitest::Test
 def setup
   @player1 = Player.new("Jack", 501)
   @player2 = Player.new("Victor", 501)

   @players = [@player1, @player2]

   @match = Match.new(@player1.name, @player2.name, 9, 5, 301);

 end

 def test_sets_needed_to_win()
    sets_needed = @match.sets_needed_to_win
    assert_equal(5, sets_needed)
 end

 def test_legs_needed_to_win_set()
    legs_needed = @match.legs_needed_to_win_set
    assert_equal(3, legs_needed)
 end

 def test_set_won()
    @match.game.player2.legs_won = 3
    @match.game.player2.sets_won = 0
    @match.game.player2.current_score = 0
    @match.game.winner() 
    set_won = @match.set_won?()
    assert_equal(true, set_won)
 end
end