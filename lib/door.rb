

class Door

  attr_reader :inscription
  attr :state, :l_state
# upon initializing any door, the default door state is closed and locked.  User must set inscription upon initializing.
  def initialize (inscription, state="closed", l_state="locked")
    @inscription = inscription
    @state = state
    @l_state = l_state
  end

  def open_door
    raise DoorErrors::LStatusError, "The door is locked" if @l_state == "locked"
    raise DoorErrors::StatusError, "Door already open" if @state == "open"
    puts "You have opened the door"
    @state= "open"
  end

  def close_door
    raise DoorErrors::StatusError, "Door already closed" if @state == "closed"
    puts "You have closed the door"
      @state= "closed"
  end

  def lock_door
    raise DoorErrors::LStatusError, "The door is locked" if @l_state == "locked"
    puts "you have locked the door"
    @l_state = "locked"
  end

  def unlock_door
    raise DoorErrors::LStatusError, "Door already unlocked" if @l_state == "unlocked"
    puts "You have unlocked the door"
    @l_state = "unlocked"
  end

end

# portal = Door.new("A New World")
# # puts portal.inscription
#
# portal.unlock_door
#
# portal.open_door
#
# puts portal.state
