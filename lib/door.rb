require 'simplecov'
require 'minitest/reporters'

class Door

  attr_reader  :locked, :closed, :INSCRIPTION

  def initialize(locked, closed, inscription=nil)

    @locked = locked
    @closed = closed
    @INSCRIPTION = inscription

  end

  def lock_door
    # returns a string
    if @closed == true
      @locked = true
      return "The door is now locked"
    else 
      return "You must close the door before you can lock it!"
    end
  end

  def unlock_door
    # return a string

  end

  def open_door
    if @closed == true && @locked == false
      @closed = false
      return "Door is now open!"
    else
      return "A door must be closed and unlocked before it can open!"
    end
  end

  def close_door
    if @closed == true
      return "Door is already closed!"
    else 
      @closed = true
      return "Door is now closed!"
    end
  end


  def read_door
    if @INSCRIPTION == nil
      return "There is no inscription!"
    else
      return @INSCRIPTION
    end
  end

  def inspect_door
    return "The door is locked? #{@locked}. The door is open? #{@closed}. The door is inscribed? #{@INSCRIPTION}."
  end

end
