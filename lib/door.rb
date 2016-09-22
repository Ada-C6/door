# I used a whole bunch of TypeErrors here and I'm not convinced that was the correct decision. Oh well, maybe we will learn about exception handling soon!!!!

class Door
  attr_accessor :inscription, :opened, :locked


  # new doors are by default created with no inscription.
  # they are closed and locked by default, but that can be changed if the creator prefers.
  def initialize(inscription = nil, opened = false, locked = true)
    @inscription = inscription
    @opened = opened
    @locked = locked
  end

  # returns true if open, false if closed (aka not opened)
  def open?
    return @opened
  end

  # returns true if locked, false if not locked
  def locked?
    return @locked
  end

  # if there is not already an inscription on the door, this inscribes one.
  def inscribe(string)
    raise ArgumentError unless string.class == String

    if @inscription == nil
      @inscription = string
      return @inscription
    else
      raise TypeError.new("This door is already inscribed. Its inscription cannot be changed.")
    end
  end

  # if the door is not open and not locked, this method opens the door.
  def open_door
    if !self.open? && !self.locked?
      @opened = true
    elsif self.open?
      raise TypeError.new("This door is already opened. It cannot be opened again.")
    elsif self.locked?
      raise TypeError.new("This door is locked. It cannot be opened.")
    else
      return "this door can't be opened and we don't know why!!!!!!!!!!!!"
    end
  end


end
