# @todo rescue for ArgumentErrors
# @todo working on inspect door method
# @todo same object sign can be assigned to different doors, same with locks. FIX THIS

module Dungeon
  class Door

    attr_accessor :closed

    attr_reader :lock, :sign

    # initialize with door closed, and with/without sign/lock that have/have not been locked/inscribed
    def initialize(sign, lock = nil)

      @closed = true
      @sign = sign
      @lock = lock

      locked? ? init_state = "locked" : init_state = "unlocked"
      puts "Here stands an ancient and sturdy door. It is closed #{ locked? ? "and" : "but" } appears to be #{ init_state }."
      if sign.inscription != nil
        puts "The inscription on the door reads: '#{ sign.inscription }''"
      end
    end

    def inspect_door
      if sign.inscription == nil #no inscription
        if closed?
          return "Here stands an ancient and sturdy door. It is closed #{ locked? ? "and" : "but" } appears to be #{ locked? ? "locked" : "unlocked" }."
        else # open door
          return "Here stands an ancient and sturdy door wide open."
        end
      else #inscription exists
        if closed?
          return "Here stands an ancient and sturdy door. It is closed #{ locked? ? "and" : "but" } appears to be #{ locked? ? "locked" : "unlocked" }. The door has a sign with the inscription: #{ sign.inscription }"
        else # open door
          return "Here stands an ancient and sturdy door wide open. The door has a sign with the inscription: #{ sign.inscription }"
        end
      end #if-inscription
    end #def

    def inscribe_door(words)
      sign.inscribe(words)
      return self
    end #def

    def open_door
      raise ArgumentError.new("This door is already open") if !closed?
      raise ArgumentError.new("This door is locked. Use a key to unlock it") if locked?
      @closed = false
      return self
    end

    def close_door
      raise ArgumentError.new("This door is already closed") if closed?
      @closed = true
      return self
    end

    def closed?
      return @closed
    end

    def locked?
      if lock == nil
        return false
      else
        return lock.locked?
      end
    end

    def turn_key(key_id = nil)
      raise ArgumentError.new("This door has no lock") if lock == nil
      raise ArgumentError.new("The door must be closed to use the lock") if !closed?
      # raise ArgumentError.new("The key does not match the door key hole") if @key_id != key

      lock.turn_key(key_id)
      puts "#{self.locked?} AND SOME OTHER STUFF"
      return self
    end
  end
end

# sign = Dungeon::Sign.new
# lock = Dungeon::Lock.new("ABC123")
# key = Dungeon::Key.new("ABC123")
# bad_key = Dungeon::Key.new("BADKEY")
# door = Dungeon::Door.new(sign, lock)
# # door.open_door
# # door.turn_key("BADKEY")
# door.turn_key("ABC123")
# puts door.inspect_door
# door.open_door
# puts door.inspect_door
# door.close_door
# door.turn_key("ABC123")
# puts door.inspect_door
# door.inscribe_door("Awesome door!")
# puts door.inspect_door
# door.inscribe_door("Alma was here")
# puts door.inspect_door
