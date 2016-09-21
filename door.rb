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
  attr_reader :unlocked, :open, :inscription

  def initialize(unlocked=true,open=true,inscription=false)
    # @unlocked = unlocked
    # @open
  end

  def is_door_closed?
  end

  def open_door
  end

  def close_door
  end

  def is_door_locked?
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
