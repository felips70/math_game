class Players

  attr_accessor :lifes
  attr_reader :name

  def initialize(name)
    @name = name
    @lifes = 3
  end

  def decrease_life
    @lifes = @lifes - 1
  end

  def alive?
    if @lifes > 0
      true
    else
      false
    end
  end

end


