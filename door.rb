class Door
  attr_reader :closed, :locked, :inscription

  def initialize
    @closed = true
    @locked = false
    @inscription = nil
  end
  def inscribe(inscription)
    if @inscription == nil
      @inscription = inscription
    else
      raise ArgumentError, "A door already has an inscription. Try checking door_status."
    end
  end
  def lock
    if @locked == true
      raise ArgumentError, "A door is already locked. Try checking door_status."
    else
      @locked = true
    end
  end
end
