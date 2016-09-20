class Door

  attr_reader :inscription, :is_open, :is_locked

  # I don't know from the spec whether a "default" door should be open or closed,
  # locked or unlocked. The current constructor method requires the user to
  # specify these states, though the inscription message can be omitted and
  # default to nil (since the specs make it sound like there should be the
  # possibility for a door to lack an inscription). If no inscription message
  # is provided, it can be assigned later, but only once (i.e., only if the
  # pre-existing state of the inscription variable is nil).

  def initialize (is_open, is_locked, inscription_message = nil)

    @is_open = is_open
    @is_locked = is_locked
    @inscription = inscription_message

  end

  def inscription=(message)
    if @inscription == nil
      @inscription = message
    else
      raise RuntimeError.new("A door's inscription can't be changed once it has been set")
    end
  end

  def open
    if !@is_open && !@is_locked
      @is_open = true
    else
      raise RuntimeError.new("A door must be closed and unlocked in order to be opened")
    end
  end

  def close
    if @is_open
      @is_open = false
    else
      raise RuntimeError.new("A door must be open in order to be closed")
    end
  end

  def lock
    if !@is_locked
      @is_locked = true
    else
      raise RuntimeError.new("A door must be unlocked in order to be locked")
    end
  end

  def unlock
    if @is_locked
      @is_locked = false
    else
      raise RuntimeError.new("A door must be locked in order to be unlocked")
    end
  end
end
