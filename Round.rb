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