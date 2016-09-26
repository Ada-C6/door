class Door
  attr_reader :open_status, :locked_status
  #
  def initialize(open_status, locked_status)

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

  # def lock
  #
  # end
  #
  # def unlock
  #
  # end
end
