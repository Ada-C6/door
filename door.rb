class Door
  attr_reader :inscription, :locked, :opened

  def initialize(inscription)
    @inscription = inscription
    @locked = false
    @opened = true
  end

  def open
    raise ArgumentError.new("The door is already open") if @opened == true

    raise ArgumentError.new("The door is locked and cannot be opened.") if @locked == true

    @opened = true
  end

  def close
    raise ArgumentError.new("The door is already closed") if @opened == true

    @opened = false
  end

  def lock
    raise ArgumentError.new("The door must be closed to be locked.") if @opened == true

    raise ArgumentError.new("The door must be unlocked to be locked") if @locked == true

    @locked = true
  end

  def unlock
      raise ArgumentError.new("The door is already unlocked.") if @locked == false

      @locked = false
  end

end
