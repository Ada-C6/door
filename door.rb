class Door
  attr_reader :inscription, :locked, :opened

  def initialize(inscription)
    @inscription = inscription
    @locked = false
    @opened = true
    @actions = ["open","close","lock","unlock","o","c","l","u"]
  end

  def door_locked?
    @locked == true
  end

  def door_opened?
    @opened == true
  end

  def open
    raise ArgumentError.new("The door is already open") if door_opened? == true

    raise ArgumentError.new("You cannot open a locked door") if door_locked? == true

    @opened == true
  end

  def close
    raise ArgumentError.new("The door is already closed") if door_opened? == false

    if door_locked? == true
      return false
    else
      return true
    end
  end

end
