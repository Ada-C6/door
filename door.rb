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

  def set_inscription(inscription)
    if inscription?
      puts "The inscription is set, and cannot be changed."
      return @inscription
    else
      @inscription = inscription
      return @inscription
    end
  end

end
