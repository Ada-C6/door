class Door

  attr_reader
  attr_accessor

  def initialize
    @locked = false
    @open = false
  end

  def open_if_allowed
    if locked?
      raise ArgumentError.new("You cannot open the door when it is locked.")
    elsif closed? == false
      raise ArgumentError.new("You cannot open an already open door.")
    else
      @open = true
    end
  end

  def close_if_allowed
    if locked?
      raise ArgumentError.new("The deadbolt is locked, so the door cannot close.")
    elsif closed? == false
      raise ArgumentError.new("You cannot close an already closed door.")
    else
      @open = trie
    end
  end

  def unlock_door
    if locked? == false
      raise ArgumentError.new("The door is already unlocked.")
    else
      @locked = false
    end
  end

  def lock_door
    if locked?
      raise ArgumentError.new("The door is already locked.")
    else
      @locked = true
    end
  end

  def locked?
    @locked = true
  end

  def closed?
    @open = false
  end


end


# A Door object can
#
# display an inscription
# be either open or closed, and
# be either locked or unlocked
#
# Once the writing (inscription) on a Door is set, it cannot be changed
# You should be able to look at the writing on the Door if there is any.
# Appropriate error messages should be displayed and no changes to the Door should be made, if any conditions of the functions are violated.
#
# 90% test coverage (using simplecov).
