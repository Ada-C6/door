module Dungeon
  class Door

    attr_accessor :lock_status, :inscription, :closed

    attr_reader :key_id


    # initialize with door closed, locked/unlocked, and with/without inscription
    def initialize(lock_status, key_id, inscription = nil)

      @closed = true
      @inscription = inscription
      @key_id = key_id #key identifier for lockable doors, key_id == nil means lock_status cannot change
      @lock_status = lock_status #true for locked

      @lock_status == true ? init_state = "locked" : init_state = "unlocked"
      puts "Here stands an ancient and sturdy door. It appears to be #{ init_state }."
      if @inscription != nil
        puts "The inscription over the door reads: '#{ @inscription }''"
      end
    end

    def inspect_door
      if @inscription == nil #no inscription
        if @closed == true
          return "Here stands an ancient and sturdy door. It is closed #{ @lock_status == true ? "and" : "but" } appears to be #{ @lock_status == true ? "locked" : "unlocked" }."
        else # open door
          return "Here stands an ancient and sturdy door wide open."
        end
      else #inscription exists
        if @closed == true
          return "Here stands an ancient and sturdy door. It is closed #{ @lock_status == true ? "and" : "but" } appears to be #{ @lock_status == true ? "locked" : "unlocked" }. The door has a sign with the inscription: #{ @inscription }"
        else # open door
          return "Here stands an ancient and sturdy door wide open. The door has a sign with the inscription: #{ @inscription }"
        end
      end #if-inscription
    end #def

    def inscribe_door(inscription)
      if @inscription == nil
        return @inscription = inscription
      else
        raise ArgumentError.new("The door is already inscribed with the words: '#{ @inscription }' and it cannot be changed.")
      end
    end #def

    def open_door
      raise ArgumentError.new("This door is already open") if @closed == false
      raise ArgumentError.new("This door is locked. Use a key to unlock it") if @lock_status == true

      return @closed = false
    end

    def close_door
      raise ArgumentError.new("This door is already closed") if @closed == true

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
      raise ArgumentError.new("The door must be closed to use the lock") if closed? == false
      raise ArgumentError.new("The key does not match the door key hole") if @key_id != key


      @lock_status == true ? @lock_status = false : @lock_status = true

      return @lock_status
    end
  end
end
