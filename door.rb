class Door
  attr_reader :inscription, :locked, :open

  def initialize (inscription)
    @inscription = inscription
    @locked = false
    @open = true
  end



end
