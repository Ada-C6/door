class Door
  attr_reader :locked, :open, :inscription

   # initialized door, closed and locked with no inscription
  def initialize
    @lock = true
    @open = false
    @INSCRIPTION = nil
  end

end
