class Door
  attr_accessor :status
  #having incription be an attr_reader ensures that it can not be changed.
  attr_reader :inscription

  def initialize(inscription, open_s, locked)
    @inscription = inscription
    @open = open_s
    @locked = locked
  end



end
