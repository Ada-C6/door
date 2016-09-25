class Door
  class IsOpenAndLockedError < ArgumentError; end
  class InscriptionIsNotString < ArgumentError; end
  class IsOpenIsNotBoolean < ArgumentError; end
  class IsLockedIsNotBoolean < ArgumentError; end
  class EmptyInscriptionError < ArgumentError; end
  class HasInscriptionError < StandardError; end
  class IsOpenError < StandardError; end
  class IsLockedError < StandardError; end
  class IsClosedError < StandardError; end
  class IsUnlockedError < StandardError; end

  attr_reader :is_open, :is_locked, :inscription

  def initialize(is_open = false, is_locked = false, inscription = nil)
    if is_open == true && is_locked == true
      raise IsOpenAndLockedError.new
    end
    # incription can not be a non-string expect nil
    if inscription.class != String && inscription != nil
      raise InscriptionIsNotString.new
    end
    if is_open.class != TrueClass && is_open.class != FalseClass
      raise IsOpenIsNotBoolean.new
    end
    if is_locked.class != TrueClass && is_locked.class != FalseClass
      raise IsLockedIsNotBoolean.new
    end
    @is_open = is_open #boleen
    @is_locked = is_locked #boleen
    @inscription = inscription # string
  end

  # assume the status of door(open/closed/lock/unlocked) is irrelavent to whether the door can be inscripted.
  def write(inscription)
    # incription can not be a non-string expect nil
    if inscription.class != String && inscription != nil
      raise InscriptionIsNotString.new
    end
    # request for writing an empty inscription is invalid
    if inscription == nil || inscription.empty?
      raise EmptyInscriptionError.new
    end
    # Once the writing (inscription) on a Door is set, it cannot be changed
    if self.inscription != nil
      raise HasInscriptionError.new
    end
    @inscription = inscription
  end

  def open
    # You may open a Door if and only if it is unlocked and closed
    if @is_open == true
      raise IsOpenError.new
    end
    if @is_locked == true
      raise IsLockedError.new
    end
    @is_open = true
  end

  def close
    # You may close a Door if and only if it is open
    if @is_open == false
      raise IsClosedError.new
    end
    @is_open = false
  end

  def lock
    # You may lock a Door if and only if it is unlocked
    if @is_open == true
      raise IsOpenError.new
    end
    if @is_locked == true
      raise IsLockedError.new
    end
    @is_locked = true
  end

  def unlock
    # You may unlock a Door if and only if it is locked
    if @is_locked == false
      raise IsUnlockedError.new
    end
    @is_locked = false
  end
end


# puts "------TEST--------"
# puts "----initialize----"
# door = Door.new(false, false, nil)
# door.write("Castle entrence")
# puts door.is_open
# puts door.is_locked
# puts door.inscription
# puts "----open method----"
# door.open
# puts door.is_open
# puts door.is_locked
# puts door.inscription
# puts "----close method----"
# door.close
# puts door.is_open
# puts door.is_locked
# puts door.inscription
# puts "----lock method----"
# door.lock
# puts door.is_open
# puts door.is_locked
# puts door.inscription
# puts "----unlock method---"
# door.unlock
# puts door.is_open
# puts door.is_locked
# puts door.inscription
