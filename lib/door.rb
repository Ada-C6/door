class Door

  attr_accessor
  attr_reader :inscription, :open_status, :unlocked_status

  # initializes a door, with an inscription, open_status(open/closed), and safety_status (locked/unlocked)
  def initialize(door_hash)
    @inscription = door_hash[:inscription]
    @open_status = door_hash[:open_status]
    @unlocked_status = door_hash[:unlocked_status]
  end

end 
