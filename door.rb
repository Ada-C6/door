class Door
  attr_reader :inscription, :position, :lock_status

  def initialize
    @inscription = nil
    @position = "closed"
    @lock_status = "locked"
  end

  def set_inscription(inscription)
    if @inscription == nil
      @inscription = inscription
      return @inscription
    else
      puts "The inscription is set, and cannot be changed."
      return @inscription
    end
  end
  
end
