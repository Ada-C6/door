class Door

  attr_reader :open, :unlocked
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

  def door_close
    if @open == true
      @open = false
    else
      raise ArgumentError.new("Sorry, you cannot close the door")
    end
  end

  def door_locked
    if @unlocked == true
      @unlocked = false
    else
      raise ArgumentError.new("Sorry, the door is already locked")
    end
  end

  def door_unlock
    if @unlocked == false
      @unlocked = true
    else
      raise ArgumentError.new("Sorry, the door is already unlocked")
    end
  end
end
