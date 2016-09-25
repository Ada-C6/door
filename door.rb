class Door
  attr_accessor :locked, :open_door, :inscription

   # initialized door, closed and locked with no inscription
  def initialize(lock, open)
    @locked = true
    @open = false
    @inscription = nil
  end

  def inscribe(message)
    # Once the writing (inscription) on a Door is set, it cannot be changed
    # Appropriate error messages should be displayed and no changes to the Door should be made, if any conditions of the functions are violated.
    if @inscription == nil
      @inscription = message
    else
      raise ArgumentError.new("A door already has an inscription.")
    end
  end

  def open_door
    # You may open a Door if and only if it is unlocked and closed
    # Appropriate error messages should be displayed and no changes to the Door should be made, if any conditions of the functions are violated.
    if @locked == false && @open == true
      raise ArgumentError.new("A door is already open.")
    elsif @locked == true && @open == false
      raise ArgumentError.new("A door must be unlocked before it can be opened.")
    elsif @locked == true && @open == true
      raise ArgumentError.new("A door must be closed and unlocked before it can be open.")
    else @open = true
      return "A door has been opened."
    end
  end

  def close_door
    # You may close a Door if and only if it is open
    # Appropriate error messages should be displayed and no changes to the Door should be made, if any conditions of the functions are violated.
    if @locked == false && @open == false
      raise ArgumentError.new("A door is already closed.")
    elsif @locked == true && @open == true
      raise ArgumentError.new("A door must be unlocked before it can be closed.")
    elsif @locked == true && @open == false
      raise ArgumentError.new("A door must be opened and unlocked before it can be open.")
    else @open = false
      return "A door has been closed."
    end
  end

end
