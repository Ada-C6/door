class Door

  attr_accessor :locked, :closed, :text

  def initialize
    @locked = false
    @closed = false
    @text = nil
  end

  def open_if_allowed
    if @locked == true
      raise ArgumentError.new("You cannot open the door when it is locked.")
    elsif @closed == false
      raise ArgumentError.new("You cannot open an already open door.")
    else
      @closed = false
    end
  end

  def close_if_allowed
    if @locked == true
      raise ArgumentError.new("The deadbolt is locked, so the door cannot close.")
    elsif @closed == false
      raise ArgumentError.new("You cannot close an already closed door.")
    else
      @closed = true
    end
  end

  def unlock_door
    if @locked == true
      @locked = false
    else
      raise ArgumentError.new("The door is already unlocked.")
    end
  end

  def lock_door
    if @locked == false
      @locked = true
    else
      raise ArgumentError.new("The door is already locked.")
    end
  end

  def is_door_locked
    return @locked
  end

  def is_door_closed
    return @closed
  end

  def inscription(words)
    if @text == nil
      @text = words
    else
      raise ArgumentError.new("A door may only be inscribed once.")
    end
    return @text
  end
end
