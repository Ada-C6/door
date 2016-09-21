# TODO:
# - Write error messages (asked Dan: should these error messages be raised or can they just be puts??)

class Door
  attr_reader :inscription, :opened, :locked

  def initialize
    @inscription = ""
    @opened = false
    @locked = false
  end

  def inscribe(words)
    if @inscription != ""
      raise RuntimeError.new("You can't write a door that's already been inscribed upon.")
    else
      @inscription << words.to_s
    end
    return @inscription
  end

  def open_door
    if @opened == true
      raise RuntimeError.new("This door is already open.")
    elsif @locked == true
      raise RuntimeError.new("This door is locked.")
    else
      @opened = true
    end
    return @opened
  end

  def close_door
    if @opened == false
      raise RuntimeError.new("This door is already closed.")
    else
      @opened = false
    end
  end

  def lock_door
    if @locked == true
      raise RuntimeError.new("This door is already locked.")
    elsif @opened == true
      raise RuntimeError.new("You cannot lock an open door.")
    else
      @locked = true
    end
    return @locked
  end

  def unlock_door
    if @locked == false
      raise RuntimeError.new("This door is already unlocked.")
    else
      @locked = false
    end
  end
end
