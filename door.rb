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
      raise ArgumentError.new("Inscription must be less than 20 characters.")
    end

    if @inscription == nil
      @inscription = inscription
    else
      raise ArgumentError.new("Inscription already defined. Cannot overwrite existing inscription.")
    end
  end

  def open_door
    if @open_state == :closed
      @open_state = :open
    else
      raise ArgumentError.new("Door already open. Cannot open an open door.")
    end
  end

  def close_door
    if @open_state == :open
      @open_state = :closed
    else
      raise ArgumentError.new("Door already closed. Cannot close a closed door.")
    end
  end

  def unlock
    if @lock_state == :locked
      @lock_state = :unlocked
    else
      raise ArgumentError.new("Door already unlocked. Cannot unlock an unlocked door.")
    end
  end
end
