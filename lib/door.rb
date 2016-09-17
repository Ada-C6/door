#door.rb
class Door

  attr :closed, :locked
  attr_reader :inscription

    def initialize(inscription = "Room A1", closed = true, locked = true)
      @inscription = inscription
      @closed = closed
      @locked = locked
      puts "You made a new door."
    end

    def close_door
    end

    def open_door
    end

    def lock_door
    end

    def unlock_door
    end

end
