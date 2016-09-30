require_relative "game"
require_relative "player"
require_relative "viewer"
require "pry-byebug"

class Match

  attr_accessor :sets, :legs_per_set, :start_score, :players,
                :set_thrower, :leg_thrower, :game

  def initialize(player_1_name, player_2_name, sets, legs_per_set, start_score)
    @viewer = Viewer.new()
    #player_1_name = @viewer.get_player_name(1)
    #player_2_name = @viewer.get_player_name(2)

    #@start_score = @viewer.get_start_score

    player1 = Player.new(player_1_name, start_score)
    player2 = Player.new(player_2_name, start_score)
    @start_score = start_score

    @players = [ player1, player2 ]

    #@sets = @viewer.get_number_of_sets
    #@legs_per_set = @viewer.get_number_of_legs_per_set
    @sets = sets
    @legs_per_set = legs_per_set
  
    @game = Game.new(start_score, players, sets, legs_per_set)

    @set_thrower = player1
    @leg_thrower = player1   
  end

  def turn(player) 

    @viewer.check_if_on_a_finish(player)

    player_throw = @viewer.get_throw(player)

    @viewer.check_if_bust(player, player_throw)

    @viewer.check_for_winning_throw(player, player_throw)

    player.throw_darts(player_throw)

  end 

  def sets_needed_to_win
    return (@sets / 2) + 1
  end

  def legs_needed_to_win_set
    return (@legs_per_set / 2) + 1
  end

  def set_won?()
    if ((@game.player1.legs_won == legs_needed_to_win_set) || 
          (@game.player2.legs_won == legs_needed_to_win_set) )
       
      @game.winner().sets_won += 1
      return true
    else 
      return false
    end
  end

  def match_won?()
    return ((@game.player1.sets_won == sets_needed_to_win) || (@game.player2.sets_won == sets_needed_to_win))
  end

  def play_match
    while !(match_won?()) do
      play_leg
      puts
      leg_won
    end    
  end

  def leg_won
    @game.winner().legs_won += 1
    if (set_won?())
      if (match_won?())
        display_winner("match")
        return
      else
        display_winner("set")
        new_set
      end
    else
      display_winner("leg")
      new_leg
    end
  end

  def new_leg
    new_game
    @game.thrower = switch_thrower(@leg_thrower)
    @leg_thrower = @game.thrower
  end

  def new_set
    @game.player1.legs_won = 0
    @game.player2.legs_won = 0
    new_game
    @game.thrower = switch_thrower(@set_thrower)
    @set_thrower = @game.thrower
  end

  def new_game
    @game.player1.reset(@start_score)
    @game.player2.reset(@start_score)
    @game = Game.new(@start_score, players, sets, legs_per_set)
  end

  def switch_thrower(thrower)
    if (thrower == @game.player1)
        thrower = @game.player2
    else
        thrower = @game.player1
    end 
    return thrower
  end

  def play_leg
    @viewer.print_scoreboard(@game)
    
    while !(@game.won?()) do
      turn(@game.thrower)
      @viewer.print_scoreboard(@game)
      @game.switch_thrower();
    end
  end

  def display_winner(game)
    winner = @game.winner().name
    puts "Game shot, and the #{game} to #{winner}!"
    gets.chomp
  end

  #@viewer = Viewer.new()
  #player_1_name = @viewer.get_player_name(1)
  #player_2_name = @viewer.get_player_name(2)
#
  #@start_score = @viewer.get_start_score
#
#
  #match = DartScorer.new()
  #match.play_match

end


