module Dungeon
  class LockFactory

    attr_reader :lock_id

    def initialize(lock_id)
      @lock_id = lock_id
    end

    # Returns a new object of class Lock
    def create
      Lock.new(@lock_id)
    end

  end
end
