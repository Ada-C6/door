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

  def is_door_open?
    if @door[:is_open] == "open"
      return true
    elsif @door[:is_open] == "closed"
      return false
    else
      raise ArgumentError.new("This parameter was initialized incorrectly.")
    end
  end

  def open_door
    if @door[:is_open] == "open"
      raise ArgumentError.new("The door is already open.")
    elsif @door[:is_open] == "closed"
      @door[:is_open] = "open"
    else
      raise ArgumentError
    end
  end

  def close_door
    if @door[:is_open] == "open"
      @door[:is_open] = "closed"
    elsif @door[:is_open] == "closed"
      raise ArgumentError.new("The door is already closed.")
    else
      raise ArgumentError
    end
  end

  def is_door_unlocked?
    if @door[:is_unlocked] == "unlocked"
      return true
    elsif @door[:is_unlocked] == "locked"
      return false
    else
      raise ArgumentError.new("This parameter was initialized incorrectly.")
    end
  end

  def lock_door
    if @door[:is_open] == "open"
      raise ArgumentError.new("Not possible to lock because the door is open.")
    elsif @door[:is_unlocked] == "locked"
      return "The door is already locked."
    elsif @door[:is_unlocked] == "unlocked"
      @door[:is_unlocked] = "locked"
    else
      raise ArgumentError.new("double U tee eff")
    end
  end

  def unlock_door
    if @door[:is_unlocked] == "unlocked"
      raise ArgumentError.new("The door is already unlocked.")
    else
      @door[:is_unlocked] = "unlocked"
    end
  end

  def is_there_inscription?
    if @door[:inscription] != nil
      return true
    else
      return false
    end
  end

  def read_inscription
    if @door[:inscription] != nil
      return "The door is inscribed with this message: #{@door[:inscription]}"
    else
      return "There is no inscription."
    end
  end

end

# door_initialized_wrong = Door.new("l","o",)
# ap door_initialized_wrong.is_door_open?
# ap door_initialized_wrong.open_door
# puts door_initialized_wrong.is_there_inscription?
# puts door_initialized_wrong.read_inscription
