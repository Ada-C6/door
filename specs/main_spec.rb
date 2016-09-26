require_relative 'spec_helper'
require_relative '../main_door'

describe MainDoor do
  describe "#initialize" do
    it "can create a new instance of MainDoor" do
      fridge = MainDoor.new
      fridge.must_be_instance_of(MainDoor)
    end

  end
  describe "#inscribe" do
    it "can set a value for the inscription" do
      fridge = MainDoor.new
      fridge.inscribe("yummy")
      fridge.name.must_equal("yummy")
    end

    it "cannot have the value of name change" do
      fridge = MainDoor.new
      fridge.inscribe("yummy")
      fridge.inscribe("cake")
      fridge.name.must_equal("yummy")
    end

    it "will raise and error if you try to set a value other than a string" do
      fridge = MainDoor.new
      proc { fridge.inscribe(11)}.must_raise(ArgumentError)
    end

    it "will raise and error if the strings are not all letters" do
      fridge = MainDoor.new
      proc {fridge.inscribe("11")}.must_raise(ArgumentError)
    end
    it "will raise an error if the string is empty" do
      fridge = MainDoor.new
      proc {fridge.inscribe("")}.must_raise(ArgumentError)
    end
  end
  describe "#open?" do
    it "will raise arguement if door is open" do
      fridge = MainDoor.new
      proc{fridge.open?}.must_raise(ArgumentError)
    end
  end

  describe "#check_state" do
    it "should return the state of the door" do
      fridge = MainDoor.new
      fridge.check_state
      fridge.state.must_equal("open")
    end
  end
  describe "#slam" do
    it "should change the state if you slam the door" do
      fridge = MainDoor.new
      fridge.slam
      fridge.check_state
      fridge.state.must_equal("closed")
    end
    it "should not allow a closed door to be slammed" do
      fridge = MainDoor.new
      fridge.slam
      fridge.check_state
      proc {fridge.slam}.must_raise(ArgumentError)
    end
  end
  describe "#swing" do
    it "should raise Arguement if door is already closed and the door should remain closed" do
      fridge = MainDoor.new
      fridge.slam
      fridge.check_state
      proc {fridge.swing}.must_raise(ArgumentError)
    end
  end
  describe "#lock_check" do
    it " can check if the door is locked" do
      fridge = MainDoor.new
      fridge.lock_check.must_equal("unlocked")
    end
  end

  describe "#set_code" do
    it "can set a code only if door is closed" do
      fridge = MainDoor.new
      proc {fridge.set_code}.must_raise(ArgumentError)
    end
    it "cannot change the code once set" do
      fridge = MainDoor.new
      fridge.slam
      fridge.set_code("yummy")
      fridge.set_code("beans")
      fridge.code.must_equal("yummy")
    end
    it "should only allow a string as the code" do
      fridge = MainDoor.new
      fridge.slam
      fridge.set_code(19)
      fridge.code.wont_equal(19)
    end
  end
  describe "#lock" do
    it "should only be able to lock if the door is closed" do
      fridge = MainDoor.new
      fridge.lock("ymmuy")
      fridge.lock_status.wont_equal("locked")
    end
    it "needs a code that is the reverse of the set code" do
      fridge = MainDoor.new
      fridge.slam
      fridge.set_code("yummy")
      fridge.lock("ymmuy")
      fridge.lock_status.must_equal("locked")
    end
  end
  describe "#unlock" do
    it "unlocks the door using the code" do
      fridge = MainDoor.new
      fridge.slam
      fridge.set_code("yummy")
      fridge.lock("ymmuy")
      fridge.unlock("yummy")
      fridge.lock_status.must_equal("unlocked")
    end
    it "will raise an error if the door is unlocked" do
      fridge = MainDoor.new
      fridge.slam
      fridge.set_code("yummy")
      proc {fridge.unlock("yummy")}.must_raise(ArgumentError)
    end
    it "will remain locked if you enter in the wrong code" do
      fridge = MainDoor.new
      fridge.slam
      fridge.set_code("yummy")
      fridge.lock("ymmuy")
      fridge.unlock("pizza")
      fridge.lock_status.wont_equal("unlocked")
    end
  end
  describe "#locked?" do
    it "will raise arguement if door is locked" do
      fridge = MainDoor.new
      fridge.slam
      fridge.set_code("yummy")
      fridge.lock("ymmuy")
      proc{fridge.locked?}.must_raise(ArgumentError)
    end
  end
  describe "#pry_open" do
    it " can pry a door open only if the door had been closed and unlocked" do
      fridge = MainDoor.new
      fridge.slam
      fridge.pry_open
      fridge.state.must_equal("open")
    end
  end

end
