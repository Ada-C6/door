class Door
  attr_reader :closed, :locked, :inscription

  def initialize
    @closed = true
    @locked = false
    @inscription = nil
  end
  def inscribe(inscription)
    if @inscription == nil
      @inscription = inscription
    else
      raise ArgumentError, "A door already has an inscription. Try checking door_status."
    end
  end
  def lock
    if @locked == true
      raise ArgumentError, "A door is already locked. Try checking door_status."
    else
      @locked = true
    end
  end

  def unlock
    if @locked == false
      raise ArgumentError, "A door is already unlocked. Try checking door_status."
    else
      @locked = false
    end
  end

  def open
    if @closed == false || @locked == true
      raise ArgumentError, "A door is EITHER already open, locked, OR both. Try checking door_status."
    else
      @closed = false
    end
  end


  def close
    if @closed == true || @locked == true
      raise ArgumentError, "A door is EITHER already closed, locked, OR both. Try checking door_status."
    else
      @closed = true
    end
  end
end
