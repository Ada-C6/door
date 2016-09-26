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
end
