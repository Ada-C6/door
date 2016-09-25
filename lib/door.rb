# Door Class

class Door
  attr_reader :ajar, :text, :locked

  # New doors are created with defaults: closed, unlocked and with no inscription
  def initialize(ajar = false, text = nil, locked = false)
    @ajar = ajar
    @text = text
    @locked = locked
  end

  # If the text for the inscription has already been set (i.e., text = some string),
  # the inscription will not be over-written. Otherwise, the inscription text will
  # be set.
  def inscription(words)
    if @text.class != String
      @text = words
    end
    return @text
  end

  def open
    # A door can only be opened if it is both unlocked and closed
    if !@locked && !@ajar
      @ajar = true
    else
      raise ArgumentError.new("You cannot open this door")
    end
    return @ajar
  end

  def close
    # A door can only be closed if it is open
    if @ajar
      @ajar = false
    else
      raise ArgumentError.new("You cannot close this door")
    end
    return @ajar
  end

  def lock
    # A door cannot be locked unless it is both unlocked and closed
    if !@locked && !@ajar
      @locked = true
    else
      raise ArgumentError.new("You cannot lock this door")
    end
    return @locked
  end

  def unlock
    # A door cannot be unlocked unless it locked
    # Because doors cannot be locked unless they are closed, I do not need to
    # check that the door is also closed before unlocking it.
    if @locked
      @locked = false
    else
      raise ArgumentError.new("You cannot unlock this door")
    end
    return @locked
  end

end
