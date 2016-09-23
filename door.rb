# @todo rescue for ArgumentErrors
# @todo discuss if Errors are ArgumentErrors?
# @todo check for argument type in initialize
# @todo commit message for refactor

module Dungeon
  class Door

    attr_accessor :lock_status, :inscription, :closed

    attr_reader :key_id

    # initialize with door closed, locked/unlocked, and with/without inscription
    def initialize(lock_status, key_id, inscription = nil)

      @closed = true
      @inscription = inscription
      @key_id = key_id #key identifier for lockable doors, key_id == nil means there is no lock on the door object
      @lock_status = lock_status #true for locked

      locked? ? init_state = "locked" : init_state = "unlocked"
      puts "Here stands an ancient and sturdy door. It is closed #{ locked? ? "and" : "but" } appears to be #{ init_state }."
      if @inscription != nil
        puts "The inscription on the door reads: '#{ @inscription }''"
      end
    end

    def inspect_door
      if @inscription == nil #no inscription
        if closed?
          return "Here stands an ancient and sturdy door. It is closed #{ locked? ? "and" : "but" } appears to be #{ locked? ? "locked" : "unlocked" }."
        else # open door
          return "Here stands an ancient and sturdy door wide open."
        end
      else #inscription exists
        if closed?
          return "Here stands an ancient and sturdy door. It is closed #{ locked? ? "and" : "but" } appears to be #{ locked? ? "locked" : "unlocked" }. The door has a sign with the inscription: #{ @inscription }"
        else # open door
          return "Here stands an ancient and sturdy door wide open. The door has a sign with the inscription: #{ @inscription }"
        end
      end #if-inscription
    end #def

    def inscribe_door(words)
      if @inscription == nil
        return @inscription = words.to_s
      else
        raise ArgumentError.new("The door is already inscribed with the words: '#{ @inscription }' and it cannot be changed.")
      end
    end #def

    def open_door
      raise ArgumentError.new("This door is already open") unless closed?
      raise ArgumentError.new("This door is locked. Use a key to unlock it") if locked?

      return @closed = false
    end

    def close_door
      raise ArgumentError.new("This door is already closed") if closed?

      return @closed = true
    end

    def closed?
      return @closed
    end

    def locked?
      return @lock_status
    end

    def turn_key(key = nil)
      raise ArgumentError.new("This door has no lock") if @key_id == nil
      raise ArgumentError.new("The door must be closed to use the lock") unless closed?
      raise ArgumentError.new("The key does not match the door key hole") if @key_id != key

      locked? ? @lock_status = false : @lock_status = true

      return @lock_status
    end
  end
end

door = Dungeon::Door.new(true, "GOODKEY")
# door.open_door
# door.turn_key("BADKEY")
door.turn_key("GOODKEY")
puts door.inspect_door
door.open_door
puts door.inspect_door
door.close_door
door.turn_key("GOODKEY")
puts door.inspect_door
door.inscribe_door("Awesome door!")
puts door.inspect_door
door.inscribe_door("Alma was here")
puts door.inspect_door
