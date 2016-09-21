require_relative 'spec_helper'

describe Door do
  describe "initialize" do
    # A door should be initalized without an inscription, it will have a position (let's say it is initalized as closed), and a security state (locked).
    let(:new_door) {Door.new}
    it "should be a door object" do
      new_door.must_be_instance_of(Door)
    end

    it "should not have an inscription" do
      new_door.inscription.must_equal(false)
    end

    it "should be closed" do
      new_door.position.must_equal("closed")
    end

    it "should be locked" do
      new_door.security.must_equal("locked")
    end

  end
end

# A `Door` object can
#
# - display an inscription
# - be either open or closed, and
# - be either locked or unlocked
#
# Here are some rules about how Doors work:
#
# - Once the writing (inscription) on a Door is set, it cannot be changed
# - You may open a Door if and only if it is unlocked and closed
# - You may close a Door if and only if it is open
# - You may lock a Door if and only if it is unlocked
# - You may unlock a Door if and only if it is locked
# - You should be able to check whether or not a Door is closed, check whether or not it is locked, and look at the writing on the Door if there is any.
#
# Appropriate error messages should be displayed and no changes to the Door should be made, if any conditions of the functions are violated.
