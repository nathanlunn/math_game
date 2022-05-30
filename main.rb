class Player
  attr_accessor :name, :lives

  def initialize(name)
    @name = name
    @lives = 3
  end

end

class Round
  attr_accessor :player, :question, :answer

  def initialize(player)
    @player = player
    first_num = (rand() * 20).to_i
    second_num = (rand() * 20).to_i
    @question = "what is #{first_num} plus #{second_num}"
    @answer = first_num + second_num
  end
end

class Game
  def initialize(players)
    @player1 = players[0]
    @player2 = players[1]
    @players = players
    @players.shuffle!
  end

  def play
    while (@players[0].lives != 0 && @players[1].lives !=0)
      round = Round.new(@players[0])
      
      puts "----- NEW TURN -----"
      print "#{round.player.name}: #{round.question}? "
      player_answer = (gets.chomp).to_i
      if player_answer == round.answer
        puts "#{round.player}: YES! Your are correct!"
      else
        puts "#{round.player}: I'm afraid that's the wrong answer."
        round.player.lives -= 1
      end
      puts "P1: #{@player1.lives}/3 vs P2: #{@player2.lives}/3"

      @players.rotate!
    end

    if (@player1.lives > @player2.lives)
      puts "#{@player1.name} wins with a score of #{@player1.lives}/3"
    else
      puts "#{@player2.name} wins with a score of #{@player2.lives}/3"
    end
    puts "----- GAME OVER -----"
    puts "Good Bye!"
  end
end

player1 = Player.new('Player 1')
player2 = Player.new('Player 2')

players = [player1, player2]

game1 = Game.new(players)

game1.play



