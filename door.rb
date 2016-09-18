class Door
  attr_accessor :inscription, :closed, :locked

  def initialize(closed, locked)
    @inscription = nil
    @closed = closed
    @locked = locked
  end

  def write(words)
    if @inscription == nil
      @inscription = words
    else
      raise ArgumentError.new("Error - A door may only be inscribed once")
    end
  end

  def open
    if @closed == true && @locked == false
      @closed = false
    else
      raise ArgumentError.new("Error - A door may only be opened iff it is closed and unlocked")
    end
  end

  def close
    if @closed == false
      @closed = true
    else
      raise ArgumentError.new("Error - A door may only be closed iff if is open")
    end
  end

  def lock
    if @locked == false
      @locked = true
    else
      raise ArgumentError.new("Error - A door may only be locked iff if is unlocked")
    end
  end

  def unlock
    if @locked == true
      @locked = false
    else
      raise ArgumentError.new("Error - A door may only be unlocked iff if is locked")
    end
  end
end
