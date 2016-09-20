class Door
  attr_reader :inscription
  attr_accessor :locked_door, :closed_door

  def initialize(inscription)
    @inscription = inscription
    @locked_door = locked_door
    @locked_door = true #means door is locked
    @closed_door = true
  end

  def locked?
    # puts "#{@locked_door}"
    if @locked_door == true
       puts "This door is locked to you!"
      return @locked_door
    else
       puts "Door is unlocked! Cool beans!"
      return false
    end
  end #end locked? method

  def unlock
    if @locked_door == false
      raise ArgumentError.new("Door is unlocked. You cannot unlock door if door is already unlocked.")
    end

    if @locked_door == true
      @locked_door = false
      return "door is now unlocked. Yay."
    # else
    #   return "Door is already unlocked."
    end
  end

  def lock #method to lock the door
    if @locked_door == true
  raise ArgumentError.new("You cannot lock an already locked door.")
    end

    if @locked_door == false
       @locked_door = true
      return "Door is now locked."
    end


  end #end for lock method

# def open?
#   it should check if the door is open or closed

# def gain_access
#this method will open the door if:
#the door must be unlocked already, and not open
#if it's locked and closed, user cannot gain access
#

end #end class

#we should give the door an inscription at its inception, not allow a player to change the inscription, which can be


#it should raise an error here if @locked_door is already false. can remove the else then.

#   unless @lock == true
#    raise ArgumentError.new("Cannot unlock door if door is already unlocked.")
#  end
