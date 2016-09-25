module Dungeon
  # Locks initializes with an assigned lock_id and unlocked
  class Lock

    attr_reader :id, :is_locked

    def initialize(lock_id)
      @id = lock_id
      @is_locked = false
    end

    # This method is specific to a certain type of lock that locks/unlocks like this. Door does not need to know this.
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
