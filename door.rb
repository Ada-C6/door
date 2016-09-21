class Door
  attr_reader :inscription, :opened, :locked

  def initialize
    # initially set to closed and unlocked, with no
    # inscription.
    @inscription = ""
    @opened = false
    @locked = false
  end

  def inscribe(words)
    if @inscription != ""
      raise RuntimeError.new("You can't write on a door with something on it.")
    else
      @inscription << words.to_s
    end
  end

  def open_door
    # If a door is already open, error message is raised.
    if @opened == true
      raise RuntimeError.new("This door is already open.")
    # If a door is locked, another error message is raised.
    elsif @locked == true
      raise RuntimeError.new("This door is locked.")
    # If a door is closed and unlocked, the door is opened.
    else
      @opened = true
    end
  end

  def close_door
    # If a door is already closed, error message is raised.
    if @opened == false
      raise RuntimeError.new("This door is already closed.")
    # If a door is opened, the door can be closed.
    else
      @opened = false
    end
  end

  def lock_door
    # If a door is already locked, error message is raised.
    if @locked == true
      raise RuntimeError.new("This door is already locked.")
    # If a door is open, then the door cannot be locked.
    elsif @opened == true
      raise RuntimeError.new("You cannot lock an open door.")
    # If a door is shut and unlocked, the door can be locked.
    else
      @locked = true
    end
  end

  def unlock_door
    # If the door is already unlocked, error message is raised.
    if @locked == false
      raise RuntimeError.new("This door is already unlocked.")
    # If the door is locked, it is unlocked.
    else
      @locked = false
    end
  end
end
