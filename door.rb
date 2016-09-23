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

  def open
    if @is_open == false && @is_locked == false
      puts "The door is opened now."
      @is_open = true
      return @is_open
    else
      puts "You can't open the door now. Is it currently closed and unlocked?"
      return nil
    end
    return @is_open
  end

  def close
    if @is_open == true
      puts "The door is closed now."
      @is_open = false
      return @is_open
    else
      puts "You can't close the door now. Is it currently open?"
      return nil
    end
  end

  def lock

  end

  def unlock

  end
end
