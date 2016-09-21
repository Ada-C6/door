class Door
  attr_accessor :is_open, :is_unlocked

  INSCRIPTION = "This shall not be changed."
  OPEN_ERROR = "Error, the door is open."
  CLOSE_ERROR = "Error, the door is closed."
  UNLOCK_ERROR = "Error, the door is unlocked."
  LOCK_ERROR = "Error, the door is locked."

  def initialize(opened=true, unlocked=true)
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
    end
  end

  def close_door
    if is_open == false
      raise CLOSE_ERROR
    else
      @is_open = false
    end
  end

  def unlock_door
    if is_open == true
      raise OPEN_ERROR
    elsif is_unlocked == true
      raise UNLOCK_ERROR
    else
      @is_unlocked = true
    end
  end

  def lock_door
    if is_open == true
      raise OPEN_ERROR
    elsif is_unlocked == false
      raise LOCK_ERROR
    else
      @is_unlocked = false
    end
  end

  def get_inscription
    return INSCRIPTION
  end

  def get_status
    status = "Here is the door's status
    Open: #{self.is_open}
    Unlocked: #{self.is_unlocked}
    Inscription: #{INSCRIPTION}"

    return status
  end

end

# door1 = Door.new
# door1.close_door
# door1.open_door
# door1.display_status
# door1.display_inscription
