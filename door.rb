class Door
  attr_reader :inscription, :locked, :opened

  def initialize(inscription)
    raise ArgumentError.new("The inscription on the door must be a string") unless inscription.is_a? String

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
    raise ArgumentError.new("The door is already closed") if @opened == false

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

  def inspect
    if @opened == true
      door_status = "open"
    else
      door_status = "closed"
    end

    if @locked == true
      lock_status = "locked"
    else
      lock_status = "unlocked"
    end

    return "There is a door that is #{door_status} and #{lock_status}. Its inscription reads \"#{@inscription}\"."
  end

end
