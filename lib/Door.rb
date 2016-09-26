#Door.rb

class Door

  attr_reader :inscription, :closed, :locked

  def initialize(inscription, closed=true, locked=true)
    @inscription = inscription
    @closed = closed
    @locked = locked
  end

  def close_door
    if @closed == false
      @closed = true
      return @closed
    end
    raise ArgumentError, "Door is already closed" if closed == true
  end

  def open_door
    if @closed == true && @locked == false
      @closed = false
      return @closed
    end
    raise ArgumentError, "Door is already open" if closed == false
    raise ArgumentError, "Door is locked" if locked == true
  end

  def lock
    if @locked == false
      @locked = true
      return @locked
    end
    raise ArgumentError, "Door is already locked" if locked == true
  end

  def unlock
    if @locked == true
      @locked = false
      return @locked
    end
    raise ArgumentError, "Door is already unlocked" if locked == false
  end

end
