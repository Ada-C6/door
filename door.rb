class Door
  attr_reader :inscription, :position, :lock_status

  def initialize(position, lock_status)
    @inscription = nil

    if position.downcase == "open" || position.downcase == "closed"
      @position = position.downcase
    else
      raise Exception("Invalid attribute value")
    end

    if lock_status.downcase == "unlocked" || lock_status.downcase == "locked"
      @lock_status = lock_status.downcase
    else
      raise Exception("Invalid attribute value")
    end
  end

  def inscription?
    return @inscription != nil
  end

  def open?
    return @position == "open"
  end

  def unlocked?
    return @lock_status == "unlocked"
  end

  def set_inscription(inscription)
    if inscription?
      puts "The inscription is set, and cannot be changed."
      return @inscription
    else
      @inscription = inscription
      return @inscription
    end
  end

  def close_door
    if open? && unlocked?
      @position = "closed"
      return @position
    else
      puts "You cannot close this door."
      return @position
    end
  end

  def open_door
    if open? == false && unlocked?
      @position = "open"
      return @position
    else
      puts "You cannot open this door."
      return @position
    end
  end

  def lock_door
    if unlocked?
      @lock_status = "locked"
      return @lock_status
    end
  end

  def unlock_door
    if unlocked? == false
      @lock_status = "unlocked"
      return @lock_status
    end
  end

  def check_inscription
    if inscription?
      puts "The inscription on this door says: #{@inscription}"
      return "The inscription on this door says: #{@inscription}"
    else
      puts "There is no inscription on this door."
      return "There is no inscription on this door."
    end
  end

  def check_door_position
    puts "This door is #{@position}."
    return "This door is #{@position}."
  end

  def check_lock_status
    puts "This door is #{@lock_status}."
    return "This door is #{@lock_status}."
  end
end
