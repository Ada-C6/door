module Dungeon
  class Door

    attr_accessor :lock_status, :inscription, :closed

    attr_reader :key_id


    # initialize with door closed, locked/unlocked, and with/without inscription
    def initialize(lock_status, key_id, inscription = nil)

      @closed = true
      @inscription = inscription
      @key = key_id #key identifier for lockable doors, key_id == nil means lock_status cannot change
      @lock_status = lock_status #true for locked

      @lock_status == true ? init_state = "locked" : init_state = "unlocked"
      puts "Here stands an ancient and sturdy door. It appears to be #{ init_state }."
      if @inscription != nil
        puts "The inscription over the door reads: '#{ @inscription }''"
      end
    end

    def inspect
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

      end

    end





  end
end
