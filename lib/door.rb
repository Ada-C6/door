

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
    if @state == "closed" && @l_state == "unlocked"
      @state = "open"
      puts "You have opened the door"
    elsif @state == "closed" && @l_state == "locked"
      puts "Can not open a locked door"
    else
      puts "Door already open"
    end
    return @state
  end

  def close_door
    if @state == "open"
      @state = "closed"
      puts "You have closed the door"
    else
      puts "The door is already closed"
    end
    return @state
  end

  def lock_door
    if @l_state == "unlocked"
      @l_state = "locked"
      puts "you have locked the door"
    else
      puts "Door is already locked"
    end
    return @state
  end

  def unlock_door
    if @l_state == "locked"
      @l_state = "unlock"
      puts "You have unlocked the door"
    else
      puts "Door already unlocked"
    end
    return @state
  end


end

# portal = Door.new("A New World")
# puts portal.inscription
