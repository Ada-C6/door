class Door


  attr_accessor :writing

  def initialize

  @writing = ""

  end

  def inscription(writing)
    if @writing.empty?
      @writing = writing
    else
      raise ArgumentError.new("Sorry, there is already inscription wrttten on the door")
    end
    return @writing
  end


end
