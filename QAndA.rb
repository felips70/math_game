class Question

  attr_reader :question, :ans

  def initialize
    q_arr = gen_question
    @question = q_arr[0]
    @ans = q_arr[1]
  end

  def gen_question
    resp =[]
    num1 = rand(1..20)
    num2 = rand(1..20)
    ans = num1 + num2
    question = "What does #{num1} plus #{num2} equal?"
    resp << question
    resp << ans
    resp
  end

  def correct?
    p_imput = gets.chomp
    p_ans = p_imput.to_i
    p_ans == @ans
  end


  def response(player, right)
    resp = rand(0..2)
    neg_resp = ['Seriously? No!', 'ZOMG No NO NO!', 'Haha! Nope']
    pos_resp = ['You got it!', 'Yeeee!', 'Well done!']

    if right
      puts "#{player}: #{pos_resp[resp]}"
    else
      puts "#{player}: #{neg_resp[resp]}"
    end
  end

  def ask_question(player)
    puts "#{player}: #{@question}"
  end
end
