class Door

  # I am going off the idea of a door with the lock in the knob. In a dungeon. Like we're playing a tabletop game.

  attr_reader :door_inscription, :door_state, :lock_state

  def initialize(door_inscription = "Private", door_state = "closed", lock_state = "unlocked")
    @door_inscription = door_inscription
    @door_state = door_state
    @lock_state = lock_state
  end

  def view_inscription
    return @door_inscription
  end

  def ajar
    if @door_state == "ajar"
      raise ArgumentError.new("You cannot ajar an ajar door")
    elsif @lock_state == "locked"
      raise ArgumentError.new("You cannot ajar a locked door")
    else
      @door_state = "ajar"
    end
  end

  def close
    if @door_state == "closed"
      raise ArgumentError.new("You cannot close a closed door")
    else
      @door_state = "closed"
    end
  end

  def lock
    if @lock_state == "locked"
      raise ArgumentError.new("You cannot lock a locked door")
    else
      @lock_state = "locked"
    end
  end

  def unlock
    if @lock_state == "unlocked"
      raise ArgumentError.new("You cannot unlock an unlocked door")
    else
      @lock_state = "unlocked"
    end
  end

end

# x = Door.new
# # print x.inspect
# x.ajar
# puts x.door_state
# print y.door_state.inspect
# print y.door_state
