class Door
  attr_accessor :closed, :locked, :inscription
  def initialize
    @closed = true
    @locked = false
    @inscription = nil
  end

  def open
    if (@closed == false || @locked == true)
      raise ArgumentError.new("door must be closed and unlocked to open it")
    else
      @closed = false
      return "You've opened the door."
    end
  end

  def close
    if @closed == true
      raise ArgumentError.new("the door is already closed")
    else
      @closed = true
      return "You've closed the door."
    end
  end

  def lock
    if @locked == true
      raise ArgumentError.new("the door is already locked")
    else
      @locked = true
      return "You've locked the door."
    end
  end

  def unlock
    if @locked == false
      raise ArgumentError.new("the door is already unlocked")
    else
      @locked = false
      return "You've unlocked the door."
    end
  end

  def inscribe(message)
    if @inscription != nil
      raise ArgumentError.new("the door's inscription cannot be changed")
    else
      @inscription = message
      return "You've inscribed the door with '#{@inscription}'"
    end
  end
end
