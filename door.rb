class Door
  attr_reader :inscription, :opened, :locked

  def initialize
    @inscription = "BLANK"
    @opened = false
    @locked = false

  end

  def inscribe(words)
    unless @inscription != "BLANK"
      @inscription = words
    end
    return @inscription
  end

  def read
    return @inscription
  end

  def open_door
    if @opened == false && @locked == false
      @opened = true
    end
    return @opened
  end

  def lock_door
    if @locked == false && @opened == false
      @locked = true
    end
    return @locked
  end
end
