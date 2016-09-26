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
    return closed
  end

  def open
    if closed == true && locked == false
      closed = false
    end
    return closed
  end

  def lock
    if locked == false
      locked = true
    end
    return locked
  end

  def unlock
    if locked == true
      locked = false
    end
    return locked
  end

end
