class Door
  attr_accessor :closed, :locked, :inscription
  def initialize
    @closed = true
    @locked = false
    @inscription = nil
  end

  def open
    if (@closed = false || @locked = true)
      raise ArgumentError("door must be closed and unlocked to open it")
      @closed = true
    end
    @closed = false
  end

  def close
    if @closed == true
      raise ArgumentError("door must be open in order to close it")
    end
    @closed = true
  end
end
