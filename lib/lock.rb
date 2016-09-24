module Dungeon
  class Lock

    attr_reader :id, :is_locked

    def initialize(lock_id)
      @id = lock_id
      @is_locked = false
    end

    def turn_key(key_id)
      raise ArgumentError.new("The lock needs a key with a different id") if id != key_id

      locked? ? @is_locked = false : @is_locked = true
      return @is_locked
    end

    def locked?
      return @is_locked
    end

  end
end
