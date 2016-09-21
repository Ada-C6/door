class Door
  attr_reader :open, :unlocked, :inscription

  def initialize(open = true, unlocked = true, inscription = nil)
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
    if is_open? == true
      raise "Door already open!"
    elsif is_open? == false && is_unlocked? == true
      @open = true
    end
  end

  def close_door
    if @open == false
      raise "Cannot close door. Door already closed!"
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
      raise "Cannot lock door. Door already locked!"
    elsif @unlocked == true
        @unlocked = false
    end
  end
    def unlock_door
      if @unlocked == true
        raise "Cannot unlock door. Door already unlocked!"
      elsif @unlocked == false
          @unlock = true
      end
    end

    def check_inscription(new_inscription)

      if @inscription == nil
        @inscription = new_inscription
        return @inscription
      else
        raise 'Cannot change inscription. inscription already set.'
      end
    end




end#end of class
#test inscription
# bob = Door.new(open = true, unlocked = true, inscription = nil)

# bob = Door.new(true, true, "Set if off")
# puts bob.check_inscription("Set if off part two")
# puts bob.inscription
#test init
# puts bob.open
# puts bob.unlocked
# puts bob.inscription

#test closed
# puts bob.close_door
# puts bob.is_open?
# puts bob.close_door

#test unlocked
#puts bob.is_unlocked?
# puts bob.lock_door
# puts bob.is_unlocked?
# puts bob.lock_door
# puts bob.unlock_door
# puts bob.is_unlocked?
