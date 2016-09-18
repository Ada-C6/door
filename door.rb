class Door
  attr_reader :closed, :locked, :inscription

  def initialize
    @closed = true
    @locked = false
    @inscription = nil
  end

  def inscribe(inscription)
    raise StandardError, "Door is already inscribed and inscription cannot be changed" if @inscription != nil

    @inscription = inscription.to_s
  end

end
