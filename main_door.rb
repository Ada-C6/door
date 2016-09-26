

class MainDoor
  attr_reader :name, :code, :state, :lock_status
  def initialize
    @name = name
    @state = "open"
    @lock_status = "unlocked"
    @code = code
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
    return "Oof, the door is now #{@state}"
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
  def open?
    if @state == "open"
      raise ArgumentError.new("Please close the door to perform this action")
    end
  end
  def locked?
    if @lock_status == "locked"
      raise ArgumentError.new(" You need to unlock this door to perform this action")
    end
  end
  def unlocked?
    if @lock_status == "unlocked"
      raise ArgumentError.new(" You need to lock this door to perform this action")
    end
  end
  def lock_check
    return @lock_status
  end

  def set_code(code)
    open?
    if @code != nil
      return "You have already set a code. This code cannot be changed"
    else
      if !code.is_a? String
        return "Please put in a valid string code"
      else
        code.to_s
        @code  = code
        return "Your code is #{@code}. Use this to unlock and lock the door"
      end
    end
  end

  def lock(code)
    if @code == nil
      return "You need to set code before locking the door"
    elsif open?
    elsif locked?
    end
    code.to_s.reverse!
    if @code != code
      return "Please lock with the reverse string of your original code"
    else
      @lock_status = "locked"
      return "The door is now #{@lock_status}"
    end
  end

  def unlock(code)
    open?
    unlocked?
    if code == @code
      @lock_status = "unlocked"
      return "The door is now #{@lock_status}"
    else
      return "You have entered the wrong code. This door will remain #{@lock_status}"
    end
  end
  def pry_open
    open?
    locked?
    @state = "open"
  end

end
