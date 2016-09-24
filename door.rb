class Door
  attr_reader :inscription
  attr_accessor :is_open, :is_unlocked

  OPEN_ERROR = "Error, the door is open."
  CLOSE_ERROR = "Error, the door is closed."
  UNLOCK_ERROR = "Error, the door is unlocked."
  LOCK_ERROR = "Error, the door is locked."

  def initialize(inscription="A-door-able", opened=true, unlocked=true)
    @inscription = inscription
    @is_open = opened
    @is_unlocked = unlocked
  end

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

  def close_door
    if is_open == false
      raise CLOSE_ERROR
    else
      @is_open = false
      print "Door closed\n"
    end
  end

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

  def get_inscription
    print inscription
  end

  def get_status
    print "Here is the door's status...
    Open: #{self.is_open}
    Unlocked: #{self.is_unlocked}
    Inscription: #{self.inscription}"
  end

end

# door1 = Door.new("testing", true, true)
# door1.close_door
# door1.open_door
# door1.get_status
# door1.get_inscription
