class Door

  def initialize(inscription, closed = true, locked = true)
    @inscription = inscription
    @closed = closed
    @locked = locked
  end

  def inscription
    return @inscription
  end

  def closed?
    @closed
  end

  def locked?
    @locked
  end

  def open
    if @closed && !@locked
      @closed = false
    elsif @locked
      return "Door is locked"
    else
      return "Door is already open"
    end
  end

  def close
    if !@closed
      @closed = true
    else
      return "Door is already closed"
    end
  end

  def lock
    if !@locked
      @locked = true
    else
      return "Door is already locked"
    end
  end

  def unlock
    if @locked
      @locked = false
    else
      return "Door is already unlocked"
    end
  end



end
#
# door = Door.new("hi")
# door.closed = true
