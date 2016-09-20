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
        door.lock.must_equal("door is now locked")
      end
      # this does not work, why? maybe use .each let

      it "2) should not lock an already locked door" do
        puts @locked_door
        proc { door.lock == true}.must_raise(ArgumentError)
      end
    end



end #end class
