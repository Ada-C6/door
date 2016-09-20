class Door
  attr_reader :inscription

  def initialize
    @inscription = nil
  end

  def inscribe(words)
    if @inscription != nil
      puts "Sorry, you can't inscribe a door with something on it already!"
    else
      @inscription = words
    end
    return @inscription
  end

  def read
    if @inscription == nil
      return "THIS DOOR IS BLANK"
    else
      return @inscription
    end
  end
end
