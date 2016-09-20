require_relative 'spec_helper'
require_relative '../door'

class Door
  describe "#initialize" do
    let(:door) {Door.new("you shall not pass!")}
    it "should create an instance of a door" do
      door.must_be_instance_of(Door)
    end

    it "should be given an inscription at inception with an inscrption attribute" do
      door.must_respond_to(:inscription)
    end

    # it "should not allow for its inscription to be written over" do
    # proc {door.inscription = "new inscrption"}.must_raise(ArgumentError)
    # end <== if attr accessor, not reader as currently set up
  end

  describe "#locked?" do
    let(:dave) {Door.new("this is a door")}
    it "should be locked at default" do
      # @locked_door == true
      puts "#{dave.locked_door}"
      dave.locked?.must_equal(true)
    end

    it "should tell user a door is unlocked when it's unlocked" do
      dave.unlock
      dave.locked?.must_equal(false)
    end
  end

  describe "#unlock" do
    # - You may unlock a Door if and only if it is locked
    let(:door) {Door.new("this is a door.")}
    it "should raise an error if the door is already unlocked" do
      proc {
        door.locked_door = false
        door.unlock}.must_raise(ArgumentError)
      end

      it "should be unlocked when door is locked" do
        door.unlock.must_equal("door is now unlocked. Yay.")
      end

      # it "should tell user it is already unlocked when unlocked" do
      #   door.locked_door = false
      #   door.unlock.must_equal("Door is already unlocked.")
      # end
    end

    describe "#lock" do
      let(:door) {Door.new("this is a door.")} #this is already locked
      it " 1) should lock an unlocked door" do
        door.locked_door = false
        door.lock.must_equal("Door is now locked.")
      end

      it "2) should not lock an already locked door" do
        puts @locked_door
        proc { door.lock == true}.must_raise(ArgumentError)
      end
    end

    describe "#closed?" do
      let(:door) {Door.new("this is a door.")}
      it "should be closed at default" do
        door.closed?.must_equal(true)
      end

      it "should be able to tell the user that the door is open" do
        door.closed_door = false
        door.closed?.must_equal(false)
      end
    end

    describe "#open_sesame" do
        let(:door) {Door.new("this is a door.")}
        it "should allow you to open a door if it is unlocked but closed" do
        door.unlock
        door.open_sesame.must_equal(true)
        end

        it "should not allow the user to open a door unless it's unlocked" do
          door.open_sesame.must_equal(false)
        end
    end

    describe "#gain_access" do
      let(:door) {Door.new("This is a door.")}
      it "should not let you through a door if it is locked and closed" do
        door.gain_access.must_equal(false)
      end

      it "should allow you to get through the door when it is unlocked and open" do
        door.locked_door = false
        door.closed_door = false
        door.gain_access.must_equal(true)
      end

      it "should not let you through if the door is open but locked, or vice versa" do
        door.unlock #makes door unlocked, but still closed
        puts door.locked_door
        puts door.closed_door
        door.gain_access.must_equal(false)
      end
    end

    describe "#read_door" do
    let(:door) {Door.new("This is a door.")}

    it "should allow the user to read the inscription on the door" do
      door.read_door.must_equal("Door has a sign. It says: #{door.inscription}")
    end
  end



  #describe "read door" method, to read the inscpription, ALso write a test to make sure you cannot change the text maybe?


end #end class
