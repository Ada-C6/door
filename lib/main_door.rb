require_relative 'open_door'
require_relative 'closed_door'

class MainDoor
attr_reader :name
attr_accessor :state
  def initialize
    @name = name
   @state = "open"
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

  def check_state
    return @state
  end

  def slam
    closed?
    @state = "closed"

  end

  def swing
    closed?
    counter = rand(1..9) + 1
    if counter % 3 == 0
      @state = "open"
      return "Oops this door is a little tricky. Looks like the door is #{@state}"
    else
      @state = "closed"
      return "The door is now #{@state}"
    end
  end

  def closed?
    if @state == "closed"
      raise ArgumentError.new("The door is already closed. You can't do that to a closed door")
    end
  end
end
