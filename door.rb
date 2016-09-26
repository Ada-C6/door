class Door
  attr_reader :closed, :locked, :inscription

  def initialize
    @closed = true
    @locked = false
    @inscription = nil
  end

end 
