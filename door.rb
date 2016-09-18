class Door
  attr_accessor :is_open, :is_unlocked

  INSCRIPTION = "This shall not be changed.\n"
  OPEN_ERROR = "Error, the door is open.\n"
  CLOSE_ERROR = "Error, the door is closed.\n"
  UNLOCK_ERROR = "Error, the door is unlocked.\n"
  LOCK_ERROR = "Error, the door is locked.\n"

  def initialize
    @is_open = true
    @is_unlocked = true
  end

  def open_door
    if is_open == true
      print OPEN_ERROR
    elsif is_unlocked == false
      print LOCK_DOOR
    else
      @is_open = true
      print "opened\n"
    end
  end

  def close_door
    if is_open == false
      print CLOSE_ERROR
    else
      @is_open = false
      print "closed\n"
    end
  end

  def unlock_door
    if is_open == true
      print OPEN_ERROR
    elsif is_unlocked == true
      print UNLOCK_ERROR
    else
      @is_unlocked = true
      print "unlocked\n"
    end
  end

  def lock_door
    if is_open == true
      print OPEN_ERROR
    elsif is_unlocked == false
      print LOCK_ERROR
    else
      @is_unlocked = false
      print "locked\n"
    end
  end
end

door1 = Door.new
door1.close_door
door1.close_door
door1.open_door
