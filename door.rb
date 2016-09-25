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
    end
  end

  def close
    if @closed == true
      raise ArgumentError.new("the door is already closed")
    else
      @closed = true
    end
  end

  def lock
    if @locked == true
      raise ArgumentError.new("the door is already locked")
    else
      @locked = true
    end
  end

  def unlock
    if @locked == false
      raise ArgumentError.new("the door is already unlocked")
    else
      @locked = false
    end
  end
end
