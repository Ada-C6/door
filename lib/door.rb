class Door

  attr :open, :locked

    def initialize(inscription ="Room 541", closed = false, locked = true )
      @inscription = inscription
      @open = closed
      @locked = locked
      puts "You made a new door."
    end




end

Door.new
