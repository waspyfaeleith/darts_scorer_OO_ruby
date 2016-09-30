require_relative('throw')
require 'pry-byebug'

class Game
  attr_accessor(:player1, :player2, :start_score, :thrower,
              :sets, :legs_per_set)

  def initialize(score, players, sets, legs_per_set)
    @start_score = score
    @player1 = players[0]
    @player2 = players[1]
    @thrower = @player1
    @sets = sets
    @legs_per_set = legs_per_set
  end

  def switch_thrower()
    if (@thrower == player1)
      @thrower = player2
    else
      @thrower = player1
    end
  end

  def won?()
    return (player1.current_score == 0 || player2.current_score == 0)
  end

  def winner()
    if (player1.current_score == 0)
      return player1
    elsif (player2.current_score == 0)
      return player2
    end
  end

end