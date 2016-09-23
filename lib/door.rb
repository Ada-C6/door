class Door

  attr_accessor :door_hash
  attr_reader :inscription, :open_status, :unlocked_status, :door_hash

  # initializes a door, with an inscription, open_status(open/closed), and safety_status (locked/unlocked)
  def initialize(door_hash)
    @door_hash = door_hash
    @inscription = door_hash[:inscription].freeze
    @open_status = door_hash[:open_status]
    @unlocked_status = door_hash[:unlocked_status]
  end
  # opens a door if certain conditions are met
  def opens
    if open_status == true || unlocked_status == false
      raise ArgumentError.new("You cannot open a door that is already open or locked!")
    else
      door_hash[:open_status] = true
    end
  end
  # closes a door if certain conditions are met
  def close
    if open_status == false
      raise ArgumentError.new("You cannot close a door that is already shut")
    else
      door_hash[:open_status] = false
    end
  end
  # locks a door if certain conditions are met
  def lock
    if unlocked_status == false
      raise ArgumentError.new("You cannot lock this door - it is already locked")
    else
      door_hash[:unlocked_status] = false
    end
  end
  #unlocks a door if certain conditions are met
  def unlock
    if unlocked_status == true
      raise ArgumentError.new("The door is already unlocked!")
    else
      door_hash[:unlocked_status] = true
    end
  end

end
