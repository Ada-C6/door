# @todo rescue for ArgumentErrors, alternatively make some errors rescued before they happen

module Dungeon
  class Door

    attr_accessor :closed, :inscription

    attr_reader :lock

    # initialize with door closed, and with/without sign/lock that have/have not been locked/inscribed
    def initialize(inscription, lock_factory = nil)
      if inscription.class != String && inscription != nil
        raise ArgumentError.new("The inscription needs to be a string or nil")
      end

      if lock_factory != nil # lock_factory can create a lock
        @lock = lock_factory.create
      end #else this instance of Door has no lock

      @closed = true
      @inscription = inscription

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
          return "Here stands an ancient and sturdy door. It is closed #{ locked? ? "and" : "but" } appears to be #{ locked? ? "locked" : "unlocked" }. The door has an inscription: #{ @inscription }"
        else # open door
          return "Here stands an ancient and sturdy door wide open. The door has an inscription: #{ @inscription }"
        end
      end #if-inscription
    end #def

    def inscribe_door(words)
      if words.class == String && words != ""
        if @inscription == nil
          @inscription = words
        else
          puts "There is already an inscription and it cannot be changed."
        end
      end
      return @inscription
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
      if @lock == nil
        return false
      else
        return @lock.locked?
      end
    end

    def locking(key_id)
      raise ArgumentError.new("This door has no lock") if lock == nil
      raise ArgumentError.new("The door must be closed to use the lock") if !closed?
      lock.locking(key_id) # returns the lock object
    end

    def unlocking(key_id)
      raise ArgumentError.new("This door has no lock") if lock == nil
      lock.unlocking(key_id) # returns the lock object
    end

  end
end
