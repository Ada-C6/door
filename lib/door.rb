require 'simplecov'
require 'minitest/reporters'

class Door

  attr_reader  :locked, :closed, :INSCRIPTION

  def initialize(locked, closed, inscription=nil)

    @locked = locked
    @closed = closed
    @INSCRIPTION = inscription

  end

  def lock

    if @closed == true
      @locked = true
    elsif @closed == false
      return "You must close the door before you can lock it!"
    else
      return "Door is already locked!"
    end

  end

  def close
    if @closed == true
      return "Door is already closed!"
    else 
      @closed = true
      return "Door is now closed!"
    end
  end


  def read
    if @INSCRIPTION == nil
      return "There is no inscription!"
    else
      return @INSCRIPTION
    end
  end

  def inspect
    return "The door is locked? #{@locked}. The door is open? #{@closed}. The door is inscribed? #{@INSCRIPTION}."
  end

end
