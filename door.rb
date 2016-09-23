# Door Exercise

class Door
  def initialize(unlocked="unlocked",open="open",inscription=nil)
    @door = {
      is_unlocked: unlocked,
      is_open: open,
      has_inscription: inscription
    }
  end

  def is_door_open?
    if @door[:is_open] == "open"
      return true
    elsif @door[:is_open] == "closed"
      return false
    else
      raise ArgumentError.new("This parameter was initialized incorrectly.")
    end
  end

  def open_door
    if self.is_door_open?
      raise ArgumentError.new("The door is already open.")
    elsif self.is_door_unlocked?
      @door[:is_open] = "open"
    else
      raise ArgumentError.new("The door is locked.")
    end
  end

  def close_door
    if self.is_door_open?
      @door[:is_open] = "closed"
    else
      raise ArgumentError.new("The door is already closed.")
    end
  end

  def is_door_unlocked?
    if @door[:is_unlocked] == "unlocked"
      return true
    elsif @door[:is_unlocked] == "locked"
      return false
    else
      raise ArgumentError.new("This parameter initialied incorrectly.")
    end
  end

  def lock_door
    if self.is_door_open?
      raise ArgumentError.new("Not possible to lock because the door is open.")
    elsif self.is_door_unlocked?
      @door[:is_unlocked] = "locked"
    else 
      raise ArgumentError.new ("The door is already locked.")
    end
  end

  def unlock_door
    if self.is_door_unlocked?
      raise ArgumentError.new("The door is already unlocked.")
    else
      @door[:is_unlocked] = "unlocked"
    end
  end

  def is_there_inscription?
    if @door[:has_inscription] == nil || @door[:has_inscription] == ""
      return false
    else
      return true
    end
  end

  def read_inscription
    if self.is_there_inscription?
      return "The door is inscribed with this message: #{@door[:has_inscription].to_s}"
    else
      return "There is no inscription."
    end
  end

end
