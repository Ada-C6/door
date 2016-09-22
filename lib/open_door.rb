require_relative 'closed_door'
require_relative 'main_door'
class OpenDoor
  attr_reader :state
  def initialize
    @state = "open"
  end

  def slam
    @state = ClosedDoor.new
  end

end
