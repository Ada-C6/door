class Door
MAX_INSCRIPTION = 20
attr_reader :inscription, :open_state, :lock_state

  def initialize
    @inscription = nil
    @lock_state = :locked
    @open_state = :closed
  end

  def inscribe(inscription)
    if inscription.class != String
      raise ArgumentError.new("Inscription must be a string.")
    end

    if inscription.length > MAX_INSCRIPTION
      puts "Please try again. Inscription must be less than #{ MAX_INSCRIPTION } characters."
      return @inscription
    end

    if @inscription == nil
      @inscription = inscription
    else
      puts "Door already inscribed. Cannot overwrite."
      return @inscription
    end
  end

  def open_door
    if @open_state == :closed && @lock_state == :unlocked
      @open_state = :open
    elsif @lock_state == :locked
      puts "Door locked. Please unlock to open."
      return @open_state
    elsif @open_state == :open
      puts "Door already open."
      return @open_state
    else
      puts "Something else has gone horribly wrong."
    end
  end

  def close_door
    if @open_state == :open
      @open_state = :closed
    else
      puts "Door already closed."
      return @open_state
    end
  end

  def unlock
    if @lock_state == :locked
      @lock_state = :unlocked
    else
      puts "Door already unlocked."
      return @lock_state
    end
  end

  def lock
    if @lock_state == :unlocked
      @lock_state = :locked
    else
      puts "Door already locked."
      return @lock_state
    end
  end

  def open_status
    @open_state
  end

  def lock_status
    @lock_state
  end

  def read_inscription
    @inscription
  end

#IS THIS LOGIC USEFUL AS IT ADDS ANOTHER STEP TO EVERYTHING?
#IF I JUST WRITE THE LOGIC IN THE OTHER METHODS, IT WILL CHECK THERE RATHER THAN THEN CALLING ANOTHER METHOD TO CHECK
#OR IS IT USEFUL HERE TO HAVE THE LOGIC ONLY IN ONE PLACE IN CASE SOMETHING CHANGES ABOUT WHAT `OPEN` MEANS???
  # def open?
  #   if @open_state == :open
  #     return true
  #   else
  #     return false
  #   end
  # end
end
