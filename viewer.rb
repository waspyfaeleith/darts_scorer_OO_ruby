class Viewer

  def print_scoreboard(game)
    puts `clear`
    puts "\t     #{game.player1.sets_won} Sets #{game.player2.sets_won}"
    puts "\t     #{game.player1.legs_won} Legs #{game.player2.legs_won}"
    puts "\t\t#{game.start_score}"
    puts "\t#{game.player1.name}\t |\t#{game.player2.name}"
    puts "-----------------------------------"
    for i in 0..game.player1.scores.size
      puts "\t#{game.player1.scores[i]}\t |\t#{game.player2.scores[i]}"
    end
    puts""
  end

  def get_score(player)
    print "#{player.name} score: "
    score = gets.to_i
    return score
  end

  def get_player_name(player_number)
    print "Player #{player_number}: "
    return gets.chomp
  end

  def get_start_score()
    print 'Start score: '
    start_score = gets.to_i()
  end

  def get_number_of_sets
    number_of_sets = 0
    while ((number_of_sets %2) == 0)
      print "How many sets ?(must be an odd number) "
      number_of_sets = gets.to_i
    end 
    return number_of_sets   
  end

  def get_number_of_legs_per_set
    number_of_legs_per_set = 0
    while ((number_of_legs_per_set %2) == 0)
      print "How many legs per set (must be an odd number)? "
      number_of_legs_per_set = gets.to_i
    end 
    return number_of_legs_per_set   
  end

  def check_if_on_a_finish(player)
    if player.is_on_a_finish?()
      puts "#{player.name}, you require #{player.current_score}"
    end
  end

  def check_if_bust(player, player_throw)
    if (player.is_bust?(player_throw))
      puts "BUST!"
      sleep 1
    end
  end

  def winner(player)
    puts "Game shot, and the leg, to #{player.name}!"
    #exit
    return
  end

  def check_for_winning_throw(player, player_throw)
    if (player.is_winning_throw?(player_throw))
      winner(player)
    end
  end

  def get_throw_score(player)
    score = get_score(player)
    player_throw = Throw.new(score)
    return player_throw
  end

  def get_throw(player)
    player_throw = get_throw_score(player)
    while !(player_throw.is_valid?()) 
      player_throw = get_throw_score(player)
    end 
    return player_throw
  end
end