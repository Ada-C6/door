class Door
  attr_reader :open, :unlocked, :inscription

  def initialize(open = true, unlocked = true, incription = nil)
  @open = open
  @unlocked = unlocked
  @inscription = inscription
  end

  def is_open?
    if @open == true
      return true
    else
      return false
    end
  end

  def open_door
    if is_open == true
      raise "Door already open!"
    else
      @open = true
    end
  end

  def close_door
    if @open == false
      puts "Cannot close door. Door already closed!"
    elsif @open == true
        @open = false
    end
  end

  def is_unlocked?
    if @unlocked == true
      return true
    else
      return false
    end
  end

  def lock_door
    if @unlocked == false
      puts "Cannot lock door. Door already locked!"
    elsif @unlocked == true
        @unlocked = false
    end

    def unlock_door
      if @unlocked == true
        puts "Cannot unlock door. Door already unlocked!"
      elsif @unlocked == false
          @unlock = true
      end
    end

  end


end#end of class
bob = Door.new
#test init
# puts bob.open
# puts bob.unlocked
# puts bob.inscription

#test closed
# puts bob.close_door
# puts bob.is_open?
# puts bob.close_door

#test unlocked
puts bob.is_unlocked?
puts bob.lock_door
puts bob.is_unlocked?
puts bob.lock_door
puts bob.unlock_door
puts bob.is_unlocked?

#test inscription
