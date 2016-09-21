module Dungeon
  class Door

    attr_accessor :lock_status, :inscription, :closed


    # initialize with door closed, locked/unlocked, and with/without inscription
    def initialize(lock_status, inscription = nil)

      @closed = true
      @lock_status = lock_status
      @inscription = inscription

      @lock_status == true ? init_state = "locked" : init_state = "unlocked"
      puts "Here stands an ancient and #{ init_state } sturdy door"
      if @inscription != nil
        puts "The inscription over the door reads: '#{ @inscription }''"
      end

    end





  end
end
