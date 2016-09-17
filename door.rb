class Door
attr_accessor :text, :opened, :locked

  def initialize
    @opened = false
    @locked = true
    @text = ""
  end

  def inscription (text = 0)
    if @text != "" && text != 0
      raise ArgumentError.new("The inscription has already been set.")
    elsif text == 0
      return @text
    else
      @text = text
    end
  end

  def open
    if @opened == true || @locked == true
      raise ArgumentError.new("The door is already opened or is locked.")
    else
      @opened = true
    end
  end

  def close
    if @opened == true
      @opened = false
    else
      raise ArgumentError.new("The door is already closed.")
    end
  end

  def lock
    if @locked == false
      @locked = true
    else
      raise ArgumentError.new("The door is already locked.")
    end
  end

  def unlock
    if @locked == true
      @locked = false
    else
      raise ArgumentError.new("The door is already unlocked.")
    end
  end

  def closed?
    return !@opened
  end

  def locked?
    return @locked
  end

end
