class Door
  attr_accessor :inscription, :opened, :locked


  # new doors are by default created with no inscription.
  # they are closed and locked by default, but that can be changed if the creator prefers.
  def initialize(inscription = nil, opened = false, locked = true)
    @inscription = inscription
    @opened = opened
    @locked = locked
  end

  def open?
    return @opened
  end

  def locked?
    return @locked
  end

end
