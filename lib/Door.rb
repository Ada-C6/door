class Door
  class IsOpenAndLockedError < ArgumentError; end
  class EmptyInscriptionError < ArgumentError; end
  class HasInscriptionError < StandardError; end
  class IsOpenError < StandardError; end
  class IsLockedError < StandardError; end
  class IsClosedError < StandardError; end
  class IsUnlockedError < StandardError; end

  attr_reader :is_open, :is_locked, :inscription

  def initialize(is_open, is_locked, inscription = nil)
    if is_open == true && is_locked == true
      raise IsOpenAndLockedError.new
    end
    @is_open = is_open #boleen
    @is_locked = is_locked #boleen
    @inscription = inscription # string
  end

  def write(inscription)
    # request for writing an empty inscription is invalid
    if inscription == nil || inscription.empty?
      raise EmptyInscriptionError.new
    end
    # Once the writing (inscription) on a Door is set, it cannot be changed
    if @inscription != nil
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

  # test: when open, can I lock it?
  # 12 cases
  
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
    @is_locked == false
  end
end
