class Door
  attr_reader :inscription, :is_open, :is_unlocked

  #Errors to raise when user tries unallowed move
  OPEN_ERROR = "Error, the door is open."
  CLOSE_ERROR = "Error, the door is closed."
  UNLOCK_ERROR = "Error, the door is unlocked."
  LOCK_ERROR = "Error, the door is locked."

  #Initializes Door object with a set inscription as well as starting out open & unlocked
  def initialize(inscription="A-door-able")
    @inscription = inscription.to_s
    @is_open = true
    @is_unlocked = true
  end

  #Instance method to open the door if it's not already open & not locked
  def open_door
    if is_open == true
      raise OPEN_ERROR
    elsif is_unlocked == false
      raise LOCK_ERROR
    else
      @is_open = true
      print "Door opened\n"
    end
  end

  #Instance method to close the door if it's not already closed
  def close_door
    if is_open == false
      raise CLOSE_ERROR
    else
      @is_open = false
      print "Door closed\n"
    end
  end

  #Instance method to unlock the door if it's not already unlocked & not open
  def unlock_door
    if is_open == true
      raise OPEN_ERROR
    elsif is_unlocked == true
      raise UNLOCK_ERROR
    else
      @is_unlocked = true
      print "Door unlocked\n"
    end
  end

  #Instance method to lock the door if it's not already locked & not open
  def lock_door
    if is_open == true
      raise OPEN_ERROR
    elsif is_unlocked == false
      raise LOCK_ERROR
    else
      @is_unlocked = false
      print "Door locked\n"
    end
  end

  #Instance method to display the inscription
  def get_inscription
    print inscription
  end

  #Instance method to display the current door details (open/closed, unlocked/locked, & inscription)
  def get_status
    print "Here is the door's status...
    Open: #{self.is_open}
    Unlocked: #{self.is_unlocked}
    Inscription: #{self.inscription}"
  end

end

# door1 = Door.new("testing")
# door1.close_door
# door1.open_door
# door1.get_status
# door1.get_inscription
