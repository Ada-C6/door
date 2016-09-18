class Door
  attr_reader :inscription
  attr_accessor :lock, :access

  def initialize(inscription)
    @inscription = inscription
    @lock = true
  end

  def locked?
    if @lock == true
      # puts "This door is locked to you!"
      return true
    else
      # puts "Door is unlocked! Cool beans!"
      return false
    end
  end #end locked? method

  def unlock
    #it should raise an error here if @lock is already false. can remove the else then.
    if @lock == true
      @lock == false
      return "door is now unlocked. Yay."
    else
      return "Door is already unlocked."
    end
  end

  # def open?
  #   it should check if the door is open or closed

  # def gain_access
    #this method will open the door if:
    #the door must be unlocked already, and not open
    #if it's locked and closed, user cannot gain access
    #



end #end class

#we should give the door an inscription at its inception, not allow a player to change the inscription, which can be

#
