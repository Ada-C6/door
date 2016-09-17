#door.rb
class Door

  attr :closed, :locked
  attr_reader :inscription #<----Once the writing (inscription) on a Door is set, it cannot be changed

    def initialize(inscription = "Room A1", closed = true, locked = true)
      @inscription = inscription
      @closed = closed
      @locked = locked
    end

    def close_door
      if @closed == true #<-- You may close a Door if and only if it is open
        raise Exception.new("The door is already closed.")
      else
        puts "You closed the door."
        return @closed = true
      end
    end

    def open_door
      if @closed == false #<--You may open a Door if and only if it is closed
        raise Exception.new("The door is already open.")
      elsif @locked == true #<-- and unlocked
        raise Exception.new("Sorry, this door is locked.")
      else
        puts "You opened the door."
        return @closed = false
      end
    end

    def lock_door
      if @locked == true #<-- You may lock a Door if and only if it is unlocked
        raise Exception.new("The door is already locked.")
      else
        puts "You locked the door."
        return @locked = true
      end
    end

    def unlock_door
      if @locked == false #<--You may unlock a Door if and only if it is locked
        raise Exception.new("The door is already unlocked.")
      else
        puts "You unlocked the door."
        return @locked = false
      end
    end

#You should be able to check whether or not a Door is closed
    def closed?
      if @closed == true
       puts "This door is closed."
       return @closed
     else
       puts "This door is open."
       return @closed
     end
   end

#check whether or not it is locked,
  def locked?
    if @locked == true
      puts "This door is locked."
     return @locked
   else
     puts "This door is unlocked."
     return @locked
   end
 end

#and look at the writing on the Door if there is any
 def read_inscription
   unless @inscription == nil || @inscription == ""
     puts "The inscription on the door says: #{@inscription}."
   else
     raise Exception.new("Nothing is inscribed on this door.")
   end
   return @inscription
 end

end

#-------------------NOTES---------------------------
#The last three methods that output information about whether the door is closed, locked or what the inscription is are somewhat redundant because we could just do something like this:

test_door = Door.new
#We can see if it is closed...
puts test_door.closed
#Similarly, if we need to know if the door is locked...
puts test_door.locked
#To look at the writing on the door...
puts test_door.inscription

#But the methods give clearer, more readable feedback to the user. If that explicit feedback is useful in the context in which this door will be used, maybe they are worth keeping.
