class Door
  attr_reader :inscription

  attr_accessor :is_open, :is_locked

  def initialize(inscription, is_open, is_locked)
    @inscription = inscription
    @is_open = is_open
    @is_locked = is_locked

    if !is_open.is_a?(TrueClass) && !is_open.is_a?(FalseClass) && !is_locked.is_a?(TrueClass) && !is_locked.is_a?(FalseClass)
      raise ArgumentError , "Invalid input. Please give me a True or False value."
    end
  end


end
