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
      return "Please try again. Inscription must be less than #{ MAX_INSCRIPTION } characters."
    end

    if @inscription == nil
      @inscription = inscription
    else
      return "Door alread inscribed. Cannot overwrite."
    end
  end

  def open_door
    if @open_state == :closed && @lock_state == :unlocked
      @open_state = :open
    elsif @lock_state == :locked
      return "Door locked. Please unlock to open."
    elsif @open_state == :open
      return "Door already open."
    else
      return "Something else has gone horribly wrong."
    end
  end

  def close_door
    if @open_state == :open
      @open_state = :closed
    else
      return "Door already closed."
    end
  end

  def unlock
    if @lock_state == :locked
      @lock_state = :unlocked
    else
      return "Door already unlocked."
    end
  end

  def lock
    if @lock_state == :unlocked
      @lock_state = :locked
    else
      return "Door already locked."
    end
  end


  def status
    status = {}
    status[:inscription_status] = @inscription
    status[:open_status] = @open_state
    status[:lock_status] = @lock_state
    
    return status
  end

#IS THIS LOGIC USEFUL AS IT ADDS ANOTHER STEP TO EVERYTHING?
#IF I JUST WRITE THE LOGIC IN THE OTHER METHODS, IT WILL CHECK THERE RATHER THAN THEN CALLING ANOTHER METHOD TO CHECK
  # def open?
  #   if @open_state == :open
  #     return true
  #   else
  #     return false
  #   end
  # end
end
