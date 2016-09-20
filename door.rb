# This is a class creating a Door object. A Door can be opened, closed, locked, and unlocked, but only if it is currently in the opposite state (an open door cannot be opened, but a locked door can be unlocked). Doors also have inscriptions on them, which can be read but not changed.
# A Door takes two boolean arguments: open and unlocked, which can be set at instantiation, and re-set with door methods, but not an attr_writer, since that is too much access.


class Door

  attr_reader :open, :unlocked, :inscription

  def initialize(open, unlocked)
    @open = open
    @unlocked = unlocked
    @inscription = ""
  end

  def open_door
    if @open
      raise ArgumentError.new("This door is already open")
    end
    return @open = true
  end

  def close_door
    if !@open
      raise ArgumentError.new("This door is already closed")
    end
    return @open = false
  end

  def unlock_door
    if @unlocked
      raise ArgumentError.new("This door is already unlocked")
    end
    return @unlocked = true
  end

  def lock_door
    if !@unlocked
      raise ArgumentError.new("This door is already locked")
    end
    return @unlocked = false
  end

  def inscribe(inscription)
    if @inscription != ""
      raise ArgumentError.new("You cannot inscribe this door again")
    end
    return @inscription = inscription
  end
end
