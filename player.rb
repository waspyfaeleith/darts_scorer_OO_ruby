#require ('pry-byebug')
class Player
  attr_accessor :name, :current_score, :scores, 
                :legs_won, :sets_won

  def initialize(name, score)
    @name = name
    @current_score = score
    @scores = [] 
    @legs_won = 0
    @sets_won = 0 
  end

  def reset(score)
    @current_score = score
    @scores = [] 
  end

  def throw_darts(player_throw)
    if (player_throw.is_valid?() && !(is_bust?(player_throw)))
      @current_score -= player_throw.score
      @scores << @current_score
    end
  end

  def is_bust?(player_throw)
    temp = @current_score - player_throw.score
    return (temp < 0 || temp == 1)
  end

  def is_winning_throw?(player_throw)
    return (is_on_a_finish?() && player_throw.is_valid?() && player_throw.score == @current_score)
  end

  def is_on_a_finish?()
    big_finishes = [170, 167, 164, 161, 160]
    return (big_finishes.include?(@current_score) || @current_score < 159)
  end

end