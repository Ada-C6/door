class Door
  attr_reader :closed, :locked, :inscription

  def initialize
    @closed = true
    @locked = false
    @inscription = nil
  end

  def inscribe(inscription)
    raise StandardError, "Door is already inscribed and inscription cannot be changed" if @inscription != nil

    @inscription = inscription.to_s
  end

  def lock
    raise StandardError, "Door is already locked" if @locked == true

    @locked = true
  end

  def unlock
    raise StandardError, "Door is already unlocked" if @locked == false

    @locked = false
  end

  def open
    raise StandardError, "Door is already open" if @closed == false
    raise StandardError, "Door is locked" if @locked == true

    @closed = false
  end

  def close
    raise StandardError, "Door is already closed" if @closed == true

    @closed = true
  end

end
