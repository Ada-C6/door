class MainDoor
attr_reader :name
  def initialize
    @name = name
  end

  def inscribe (name)
    if @name != nil
      return @name
    else
    @name = name
    return @name
    end
  end

end
