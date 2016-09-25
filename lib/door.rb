class Door

  attr_reader :open, :unlocked, :locked
  attr_accessor :writing

  def initialize(open, unlocked)
  @writing = ""
  @open = open
  @unlocked = unlocked
  end

  def inscription(writing)
    if @writing.empty?
      @writing = writing
    else
      raise ArgumentError.new("Sorry, there is already inscription wrttten on the door")
    end
    return @writing
  end

  def door_open
    if @open == false && @unlocked == true
      @open = true
    else
      raise ArgumentError.new("Sorry, you cannot open the door")
    end
    return @open
  end

end
