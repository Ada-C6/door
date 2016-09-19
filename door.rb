class Door
  attr_reader :inscription, :locked, :opened

  def initialize (inscription)
    @inscription = inscription
    @locked = false
    @opened = true
    @actions = ["open","close","lock","unlock","o","c","l","u"]
  end

  def locked?
    @locked == true
  end

  def opened?
    @opened == true
  end

  # def input(action.strip.downcase)
  #   raise ArgumentError.new("Please choose an action this door can accept.") unless @actions.include?(action)
  #
  #   return action
  # end

  def open
    raise ArgumentError.new("The door is already open") if opened? == true

    if locked? == true
      return false
    else
      return true
    end
  end


end
