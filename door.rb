class Door
  attr_reader :state_of_door, :state_of_lock, :inscription

  def initialize (state_of_door, state_of_lock, inscription = "")
    @state_of_door = state_of_door
    @state_of_lock = state_of_lock
    @inscription = inscription
  end

  def closed?
    @state_of_door == "closed"
  end

  def locked?
    @state_of_lock == "locked"
  end

  def inscription?
    @inscription != ""
  end

  def open
    if closed?
      if locked?
        raise ArgumentError, "Sorry, this door is currently locked."
      else
        @state_of_door = "open"
        return @state_of_door
      end
    else
      raise ArgumentError, "Be more aware, this door is already open."
    end
  end

  def close
    if closed? == false
      @state_of_door = "closed"
      return @state_of_door
    else
      raise ArgumentError, "Be more aware, this door is already closed."
    end
  end

  def lock
    if locked?
      raise ArgumentError, "Sorry, this door is currently locked."
    else
      @state_of_lock = "locked"
      return @state_of_lock
    end
  end

  def unlock
    if locked?
      @state_of_lock = "unlocked"
      return @state_of_lock
    else
      raise ArgumentError, "You don't need to unlock this door, it's already unlocked."
    end
  end

  def read
    if inscription?
      return @inscription
    else
      raise ArgumentError, "This door doesn't have an inscription on it."
    end
  end
end
