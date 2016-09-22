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


  def inscribe(string)
    raise ArgumentError unless string.class == String

    if @inscription == nil
      @inscription = string
      return @inscription
    else
      raise TypeError.new("This door is already inscribed. Its inscription cannot be changed.")
    end

  end

end
