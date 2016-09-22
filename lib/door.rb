class Door
  attr_accessor :inscription, :opened, :locked

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
