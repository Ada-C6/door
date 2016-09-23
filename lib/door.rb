

class Door

  attr_reader :inscription
  attr :state, :l_state
# upon initializing any door, the default door state is closed and locked.
  def initialize (inscription, state = "closed", l_state = "locked")
    @inscription = inscription
    @state = "closed"
    @l_state = "locked"
  end

  def open_door
    if @state == "closed"
      @state = "open"
      puts "you've opened the door"
    else
      return "Door is already open"
    end
  end

  def close_door
    if @state == "open"
      @state = "closed"
      puts "you've closed the door."
    else
      return "Door is already closed"
    end
  end

  def lock_door
    if @l_state == "unlocked"
      @l_state = "locked"
      puts "you've locked the door."
    else
      return "Door is already locked"
    end
  end

  def unlock_door
    if @l_state == "locked"
      @l_state = "unlock"
      puts "you've unlocked the door."
    else
      return "Door is already unlocked"
    end
  end

  # def read_inscription
  # end

end

portal = Door.new("A New World")
puts portal.inscription
