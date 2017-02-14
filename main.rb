#Classes:
  #Game:
    #vars: current_player, players, curr_answer, curr_question
    #methods: game_loop, output_lives, decrease_live
  #Players:
    #vars: name, lives
    #methods: alive?
  #Questions/answers:
    #methods: gen_quesiton, ask_question, correct?, response

require './Players.rb'
require './QAndA.rb'


class Game

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @current_player = player1
  end

  def game_loop
    while @player1.alive? && @player2.alive?
      question = Question.new

      question.ask_question(@current_player.name)

      correct = question.correct?

      if correct
        question.response(@current_player.name, correct)
      else
        question.response(@current_player.name, correct)
        @current_player.decrease_life
      end
      disp_lifes

      change_current_p

      if @player1.alive? && @player2.alive?
        puts '----- NEW TURN -----'
      end
    end
    puts '----- GAME OVER -----'
    who_won
  end

  def who_won
    if @player1.alive?
      puts "#{@player1.name} wins with a score of #{@player1.lifes}/3"
    else
      puts "#{@player2.name} wins with a score of #{@player2.lifes}/3"
    end
  end

  def disp_lifes
    puts "P1: #{@player1.lifes}/3 vs P2: #{@player2.lifes}/3"
  end

  def change_current_p
    if @current_player == @player1
      @current_player = @player2
    else
      @current_player = @player1
    end
  end

end


p1 = Players.new('Player 1')
p2 = Players.new('Player 2')

game = Game.new(p1, p2)

game.game_loop