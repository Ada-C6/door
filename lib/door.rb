#door.rb
class Door

  attr :closed, :locked
  attr_reader :inscription

    def initialize(inscription = "Room A1", closed = true, locked = true)
      @inscription = inscription
      @closed = closed
      @locked = locked
      # puts "You made a new door."
    end

    def close_door
      if @closed == true
        raise Exception.new("The door is already closed.")
      else
        puts "You closed the door."
        return @closed = true
      end
    end

    def open_door
      if @closed == false
        raise Exception.new("The door is already open.")
      elsif @locked == true
        raise Exception.new("Sorry, this door is locked.")
      else
        puts "You opened the door."
        return @closed = false
      end
    end

    def lock_door
      if @locked == true
        raise Exception.new("The door is already locked.")
      else
        puts "You locked the door."
        return @locked = true
      end
    end

    def unlock_door
      if @locked == false
        raise Exception.new("The door is already unlocked.")
      else
        puts "You unlocked the door."
        return @locked = false
      end
    end

end
