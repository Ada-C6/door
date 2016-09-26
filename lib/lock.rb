module Dungeon
  class Lock

    attr_reader :id, :lock_type, :is_locked

    def initialize(lock_id, lock_type = :default_lock)
      @id = lock_id
      @lock_type = lock_type # does not come into play unless subclasses of this class are created

      @is_locked = false
    end

    # This method and locking/unlocking too are specific to a certain type of lock that locks/unlocks like this, the only implemented in my Dungeon. Door does not need to know this.
    def turn_key
      locked? ? @is_locked = false : @is_locked = true
      return self
    end

    def locked?
      return @is_locked
    end

    def locking(key_id)
      raise ArgumentError.new("The lock needs a key with a different id") if id != key_id
      if locked?
        puts "The lock is already locked"
      else
        turn_key
      end
      return self
    end

    def unlocking(key_id)
      raise ArgumentError.new("The lock needs a key with a different id") if id != key_id
      if locked?
        turn_key
      else
        puts "The lock is already unlocked"
      end
      return self
    end

  end
end
