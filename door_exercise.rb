class Door
  attr_reader :inscription, :is_open, :is_locked

  # When a new Door object is created, whether the door is
  # - open: true /closed: false (first argument)
  # - locked: true /unlocked: false (second argument)
  # is determined by the boolean

  def initialize(is_open, is_locked, inscription = "")
    @is_open     = is_open
    @is_locked   = is_locked
    @inscription = inscription
  end

  def inscribe(words)
    raise Exception, "There is already something written here." unless inscription.empty?
    @inscription = words
  end

  def open
    raise Exception, "This door can't be opened." unless closed? && unlocked?
    @is_open = true
  end

  def close
    raise Exception, "This door can't be closed." unless open?
    @is_open = false
  end

  def lock
    raise Exception, "This door can't be locked" unless unlocked?
    @is_locked = true
  end

  def unlock
    raise Exception, "This door can't be unlocked" unless locked?
    @is_locked = false
  end

  private
  # Private helper methods for readability

  def open?
    is_open
  end

  def closed?
    !is_open
  end

  def locked?
    is_locked
  end

  def unlocked?
    !is_locked
  end

end
