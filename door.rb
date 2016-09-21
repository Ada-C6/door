# Door Exercise
# A computer game usually has many different objects that can be seen and manipulated.
# Here are some rules about how Doors work:
# - Once the writing (inscription) on a Door is set, it cannot be changed
# - You may open a Door if and only if it is unlocked and closed
# - You may close a Door if and only if it is open
# - You may lock a Door if and only if it is unlocked
# - You may unlock a Door if and only if it is locked
# - You should be able to check whether or not a Door is closed, check whether or not it is locked, and look at the writing on the Door if there is any.
#
# Appropriate error messages should be displayed and no changes to the Door should be made, if any conditions of the functions are violated.
#
# You should write specs for this class, to achieve at least 90% test coverage (using `simplecov`).
require 'awesome_print'

class Door
  attr_reader :is_unlocked, :is_open, :has_inscription

  def initialize(unlocked="unlocked",open="open",inscription=nil)
    @door = {
      is_unlocked: unlocked,
      is_open: open,
      has_inscription: inscription
    }
  end

  def is_door_closed?
    if @door[:is_open] == "open"
      return "Door is open."
    else
      return "Door is closed."
    end
  end

  def open_door
    if @door[:is_open] == "open"
      raise ArgumentError.new("The door is already open.")
    else
      @door[:is_open] = "open"
    end
  end

  def close_door
    if @door[:is_open] == "open"
      @door[:is_open] = "closed"
    else
      raise ArgumentError.new("The door is already closed.")
    end
  end

  def is_door_locked?
    if @door[:is_unlocked]
      return "Door is unlocked."
    else
      return "Door is locked."
    end
  end

  def lock_door
  end

  def unlock_door
  end

  def is_there_inscription?
  end

  def read_inscription
  end

end

# closed_unlocked = Door.new(true,false,)
# closed_unlocked.open_door
# puts closed_unlocked.is_door_closed?

# closed_door = Door.new(false,false,"inscription")
# ap closed_door
# ap closed_door.is_door_closed? #Door is closed
# ap closed_door.open_door #true
# ap closed_door
# ap closed_door.is_open
# ap closed_door.is_door_closed? #"Door is open"
# ap closed_door #false
# puts now_open.open #true
# puts now_open.is_door_closed?
# puts now_open.open
# an_open_door = Door.new
# puts an_open_door.open
