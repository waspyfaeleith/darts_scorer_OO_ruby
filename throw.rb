class Throw
  attr_reader :score

  def initialize(score)
    @score = score
  end

  def is_valid?()
    valid_high_scores = [180, 177, 174, 171, 170, 167, 165, 164 ]
    if (valid_high_scores.include?(@score) || (@score < 163))
      return true
    else
      return false
    end
  end
end