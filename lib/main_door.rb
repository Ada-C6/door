require_relative 'open_door'
require_relative 'closed_door'

class MainDoor
attr_reader :name
attr_accessor :state, :lock_status
  def initialize
    @name = name
   @state = "open"
   @lock_status = "unlocked"

  end

  def inscribe (name)
    inscribe_rules(name)
    if @name != nil
      return "You have already inscribed the door with #{@name}!"
    else
    @name = name
    return "The inscription on the door is now and forver #{@name}"
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
    return "The door is currently #{@state}"
  end

  def slam
    closed?
    @state = "closed"
    return "Oof the door is now #{@state}"
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
  def lock_check
    return @lock_status
  end
end
