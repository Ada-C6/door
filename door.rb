class Door
  attr_accessor :locked, :open, :inscription

   # initialized door, closed and locked with no inscription
  def initialize(lock, open)
    @lock = true
    @open = false
    @inscription = nil
  end

  def inscribe(message)
    # Once the writing (inscription) on a Door is set, it cannot be changed
    # Appropriate error messages should be displayed and no changes to the Door should be made, if any conditions of the functions are violated.
    if @inscription == nil
      @inscription = message
    else
      raise ArgumentError.new("This door already has an inscription!")
    end
  end

end
