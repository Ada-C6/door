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

end
