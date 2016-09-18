class Door
MAX_INSCRIPTION = 20
attr_reader :inscription, :open_state

  def initialize
    @inscription = nil
    @lock_state = :locked
    @open_state = :closed
  end

  def inscribe(inscription)
    if inscription.class != String
      raise ArgumentError.new("Inscription must be a string.")
    end

    if inscription.length > MAX_INSCRIPTION
      raise ArgumentError.new("Inscription must be less than 20 characters.")
    end

    if @inscription == nil
      @inscription = inscription
    else
      raise ArgumentError.new("Inscription already defined. Cannot overwrite existing inscription.")
    end
  end

  def open
    @open_state = :open
  end
end
