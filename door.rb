class Door
  attr_reader :inscription, :position, :security

  def initialize
    @inscription = false
    @position = "closed"
    @security = "locked"
  end
end
