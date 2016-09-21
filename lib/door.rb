class Door

  def initialize(inscription, closed = True, locked = True)
    @inscription = inscription
    @closed = closed
    @locked = locked
  end

  def inscription
    inscription
  end

  def closed?
    @closed
  end

  def locked?
    @locked
  end

  def open
    if @closed
      @closed = False
    else
      raise Error, "Door is already open"
    end
  end

  def close
    if !@closed
      @closed = True
    else
      raise Error, "Door is already closed"
    end
  end

  def lock
    if !@locked
      @locked = True
    else
      raise Error, "Door is already locked"
    end
  end

  def unlock
    if @locked
      @locked = False
    else
      raise Error, "Door is already unlocked"
  end



end
