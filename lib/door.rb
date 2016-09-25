

class Door

  attr_reader :inscription
  attr :state, :l_state
# upon initializing any door, the default door state is closed and locked.
  def initialize (inscription, state="closed", l_state="locked")
    @inscription = inscription
    @state = state
    @l_state = l_state
  end

  def open_door
    raise StatusError, "Door already open" if @state == "open"
    raise LStatusError, "The door is locked" if @l_state == "locked"
    if @state == "closed" && @l_state == "unlocked"
      @state= "open"
      puts "You have opened the door"
    end
    return @state
  end

  def close_door
    raise StatusError, "Door already closed" if @state == "closed"
    if @state == "open"
      @state= "closed"
      puts "You have closed the door"
    end
    return @state
  end

  def lock_door
    raise LStatusError, "The door is locked" if @l_state == "locked"
    if @l_state == "unlocked"
      @l_state = "locked"
      puts "you have locked the door"
    end
    return @state
  end

  def unlock_door
    raise LStatusError, "Door already unlocked" if @l_state == "unlocked"
    if @l_state == "locked"
      @l_state = "unlock"
      puts "You have unlocked the door"
    end
    return @state
  end


end

# portal = Door.new("A New World")
# puts portal.inscription
