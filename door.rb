class Door
  attr_reader :inscription, :position, :security

  def initialize
    @inscription = nil
    @position = "closed"
    @security = "locked"
  end

  def inscribe(message)
    # I want to rescue the error, but I'm not sure how to write the test if I rescue it.
    # begin
      if @inscription == nil && @position == "closed"
        @inscription = message
      elsif @position == "open"
        raise RuntimeError.new("Door cannot be inscribed while it's open.")
      else
        raise RuntimeError.new("Door is already inscribed.")
      end
    # rescue Exception => m
    #   return m.message
    # end
  end

  def open_door
    if @position == "closed" && @security == "unlocked"
      @position = "open"
    elsif @security == "locked"
      raise RuntimeError.new("Door is locked.")
    else
      raise RuntimeError.new("Door is already open.")
    end
  end

  def close_door
    if @position == "open" && @security == "unlocked"
      @position = "closed"
    elsif @security == "locked"
      raise RuntimeError.new("Door is locked and cannot be closed.")
    else
      raise RuntimeError.new("Door is already closed.")
    end
  end

  def unlock_door
    if @security == "locked"
      @security = "unlocked"
    else
      raise RuntimeError.new("Door is already unlocked.")
    end
  end

  def lock_door
    if @security == "unlocked"
      @security = "locked"
    else
      raise RuntimeError.new("Door is already locked.")
    end
  end

end
