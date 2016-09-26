#Door.rb

class Door

  attr_reader :inscription, :closed, :locked

  def initialize(inscription, closed=true, locked=true)
    @inscription = inscription
    @closed = closed
    @locked = locked
  end

  def close
    if closed == false
      closed = true
    end
    raise ArgumentError.new("Door is already closed") if closed == true
    return closed
  end

  def open
    if closed == true && locked == false
      closed = false
    end
    raise ArgumentError.new("Door is already open") if closed == false
    raise ArgumentError.new("Door is locked") if locked == true
    return closed
  end

  def lock
    if locked == false
      locked = true
    end
    raise ArgumentError.new("Door is already locked") if locked == true
    return locked
  end

  def unlock
    if locked == true
      locked = false
    end
    raise ArgumentError.new("Door is already unlocked") if locked == false
    return locked
  end

end
