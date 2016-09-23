class Door
  attr_reader :inscription
  attr_accessor :locked_door, :closed_door

  def initialize(inscription)
    #I chose to make the inscpription here with a reader property because it makes sense that once a door is made, it would be made with an inscription that the user couldn't change. Door also starts at a default of locked and closed, since many games require the player to find a way to unlock and open a door when the player comes across a door.
    @inscription = inscription
    @locked_door = true #means door is locked
    @closed_door = true #door is closed
  end

  def locked?
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

def closed?
#   it should check if the door is open or closed
  if @closed_door == true
    puts "This door is closed to you."
    return true
  else
    puts "door is open! yay."
    return false
  end
end

def open_sesame #if a door is unlocked, you can open the door with this method.
  if @locked_door == false
    @closed_door = false
    puts "The door is unlocked, so you open the door!"
    return true
  else
    puts "You have to unlock the door first before you can open this door."
    return false
  end
end

def gain_access #moves you through the door. requires that the door be unlocked by the player, as well as opened by the player. Requiring the two steps/methods is more explicit in this case, as I'm imagining that the player would have to take a key to unlock the door and then physically push the door open (using open_sesame). Though now that I think about it, some games automatically open the door when you unlock it, which would make this method useless.
  if (@locked_door == true) && (@closed_door == true)
    puts "You cannot gain access to a locked and closed door."
    return false
  elsif (@locked_door == false) && (@closed_door == true)
    puts "the door is unlocked, but you'll need to try opening the door"
    return false
  else
    puts "The door is open and unlocked! Yay, you can go through!"
    return true
  end
end

def read_door
  return "Door has a sign. It says: #{inscription}"
end

end #end class
