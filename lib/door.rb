#door.rb
class Door

  attr :closed, :locked
  attr_reader :inscription

    def initialize(inscription ="Room A3", closed = true, locked = true )
      @inscription = inscription
      @closed = closed
      @locked = locked
      puts "You made a new door."
    end

end
