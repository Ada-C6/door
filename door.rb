# @todo - use errors other than ArgumentError for invalid things user attempts? (unlock a door that can't be, inscribe a door that can't be, etc)

class Door
  attr_accessor :locked, :closed
  attr_reader :inscription

  # attr_reader :inscription

  # Initialize with 2 or 3 parameters:
  # - locked: boolean
  # - closed: boolean
  # - inscription (optional): a String or nil (default value: nil)
  def initialize(locked, closed, inscription=nil)
    # ensure locked argument is boolean, raise ArgumentError if not
    if !(locked == true || locked == false)
      raise ArgumentError, "The locked parameter must be a boolean."
    end

    # ensure locked argument is boolean, raise ArgumentError if not
    if !(closed == true || closed == false)
      raise ArgumentError, "The closed parameter must be a boolean."
    end

    # ensure a locked door is closed, raise ArgumentError if not
    if closed == false && locked == true
      raise ArgumentError, "A locked door must also be closed."
    end

    @locked = locked
    @closed = closed
    @inscription = inscription
  end #initialize

  def is_locked?
    return @locked
  end

  def is_closed?
    return @closed
  end

  def has_inscription?
    return @inscription != nil ? true : false
  end

  def lock
    if @locked == false && @closed == true
      @locked = true
    elsif @locked == true
      raise RuntimeError, "Invalid operation; door is already locked."
    elsif @closed == false
      raise RuntimeError, "Invalid operation; door must be closed before locking."
    end
  end #lock

  def unlock
    if @locked == true
      @locked = false
    elsif @locked == false
      raise RuntimeError, "Invalid operation; door is already unlocked."
    end
  end #unlock

  def open_door
    if @locked == false && @closed == true
      @closed = false
    elsif @locked == true
      raise RuntimeError, "Invalid operation; door must be unlocked before open."
    elsif @closed == false
      raise RuntimeError, "Invalid operation; door is already open."
    end
  end #open

  def close_door
    if @closed == false
      @closed = true
    elsif @closed == true
      raise RuntimeError, "Invalid operation; door is already closed."
    end
  end #close_door

  def inscribe(inscription)
    if has_inscription? == false
      @inscription = inscription
    elsif has_inscription?
      raise RuntimeError, "Invalid operation; door is already inscribed. A door can be inscribed only once."
    end
  end

  def display_inscription
    if has_inscription?
      puts @inscription
    else
      puts "nil"
    end
  end

end # Door
