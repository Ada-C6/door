class MainDoor
attr_reader :name
  def initialize
    @name = name
  end

  def inscribe (name)
    inscribe_rules(name)
    if @name != nil
      return @name
    else
    @name = name
    return @name
    end
  end

  def inscribe_rules(name)
    if !name.is_a? String
      raise ArgumentError.new("Only enter in letters! This door is sensitive!")
    elsif name !~ /[[:alpha:]]/
      raise ArgumentError.new("Just because it is a string, doesn't mean your entry is valid. Letters only please!")
    end
  end
end
