class Door
  attr_reader :inscription
  attr_accessor :is_open, :is_locked

  # attr_reader and attr_accessor would allow users to  check whether or not a Door is closed, check whether or not it is locked, and look at the writing on the Door if there is any. 
  # attr_reader ensures that once the writing (inscription) on a Door is set, it cannot be changed.

  def initialize(inscription, is_open, is_locked)
    @inscription = inscription
    @is_open = is_open # open = true, closed = false
    @is_locked = is_locked # locked = true, unlocked = false

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
    if @is_locked == false
      puts "The door is locked now."
      @is_locked = true
      return @is_locked
    else
      puts "You can't lock the door now. It's already locked."
      return nil
    end
  end

  def unlock
    if @is_locked == true
      puts "The door is unlocked now."
      @is_locked = false
      return @is_locked
    else
      puts "You can't unlock the door now. It's already unlocked."
      return nil
    end
  end
end
