class Door
  attr_reader :open_status, :locked_status, :inscription

  def initialize(open_status, locked_status, inscription = "")
    open_status = @open_status
    locked_status = @locked_status
    inscription = @inscription
  end

  def open
    raise ArgumentError.new("The door is already open!") unless @open_status == false
    raise ArgumentError.new("The door is locked!") unless @locked_status == false
    @open_status = true
    return @open_status
  end

  def close
    raise ArgumentError.new("The door is already closed!") unless @open_status == true
    @open_status = false
    return @open_status
  end

  def lock
    raise ArgumentError.new("The door is already locked!") unless @locked_status == false
    @locked_status = true
    return @locked_status
  end

  def unlock
    raise ArgumentError.new("The door is already unlocked!") unless @locked_status == true
    @locked_status = false
    return @locked_status
  end

  def read
    if @inscription != ""
      puts @inscription
      return true
    else
      puts "There is no inscription on this door."
      return false
    end
  end


end
