class Door
  attr_reader :inscription, :is_open

  # when a new Door object is created, whether the door is
  # - open: true /closed: false (first argument)
  # is determined by the boolean

  def initialize(is_open, inscription = "")
    @is_open = is_open
    @inscription = inscription
  end

end
