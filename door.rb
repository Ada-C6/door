class Door

  attr_accessor :locked, :closed, :text

  def initialize
    #Initially set the door to unlocked and open
    @locked = false
    @closed = false
    @text = nil
  end

  def open_if_allowed
    # A locked or already open door may not be opened
    if @locked == true
      raise ArgumentError.new("You cannot open the door when it is locked.")
    elsif @closed == false
      raise ArgumentError.new("You cannot open an already open door.")
    else
      @closed = false
    end
  end

  def close_if_allowed
    # A locked (deadbolt turned 'on') or closed door cannot be closed
    if @locked == true
      raise ArgumentError.new("The deadbolt is locked, so the door cannot close.")
    elsif @closed == false
      raise ArgumentError.new("You cannot close an already closed door.")
    else
      @closed = true
    end
  end

  def unlock_door
    # A locked door becomes unlocked
    if @locked == true
      @locked = false
    # An unlocked door may not be opened
    else
      raise ArgumentError.new("The door is already unlocked.")
    end
  end

  def lock_door
    # An unlocked door becomes locked
    # I assumed that an opened door can be locked, since a deadbolt still
    # works on an open door
    if @locked == false
      @locked = true
    # A locked door may not be locked again
    else
      raise ArgumentError.new("The door is already locked.")
    end
  end

  # Allows the user to check whether the door is locked
  def is_door_locked
    return @locked
  end

  # Allows the user to check whether the door is closed
  def is_door_closed
    return @closed
  end

  # Allows the user to inscribe the door
  def inscription(words)
    if @text == nil
      @text = words
    # If the door is already inscribed, it may not be modified
    else
      raise ArgumentError.new("A door may only be inscribed once.")
    end
    return @text
  end
end
