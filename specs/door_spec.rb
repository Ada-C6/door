require_relative 'spec_helper'



# @todo would like to see more negative tests, what-if

module Dungeon
  describe Door do

    describe "#initialize" do
      let(:door) { Door.new(:lock_status, :key_id) }

      it "can create an object of Door" do
        door.must_be_instance_of(Door)
      end

      it "should respond to parameters of door status" do
        door.must_respond_to(:lock_status)
        door.must_respond_to(:key_id)
        door.must_respond_to(:inscription)
      end

      it "should be a closed door that initializes" do
        door.closed.must_equal(true)
      end

    end #init

    describe "#inspect" do
      let(:unlocked_door_no_inscript) { Door.new(false, nil) }
      let(:locked_door_no_inscript) { Door.new(true, "ABC123") }
      let(:unlocked_door_with_inscript) { Door.new(false, nil, "Push to open") }
      let(:locked_door_with_inscript) { Door.new(true, "ABC123", "Use key to open") }

      it "should be possible to inspect a closed door without an inscription for its state of locked/unlocked" do
        unlocked_door_no_inscript.inspect_door.must_equal("Here stands an ancient and sturdy door. It is closed but appears to be unlocked.")
        locked_door_no_inscript.inspect_door.must_equal("Here stands an ancient and sturdy door. It is closed and appears to be locked.")
      end

      it "should be possible to inspect a closed door with an inscription for its state of locked/unlocked" do
        unlocked_door_with_inscript.inspect_door.must_equal("Here stands an ancient and sturdy door. It is closed but appears to be unlocked. The door has a sign with the inscription: Push to open")
        locked_door_with_inscript.inspect_door.must_equal("Here stands an ancient and sturdy door. It is closed and appears to be locked. The door has a sign with the inscription: Use key to open")
      end

      it "should be possible to inspect an open door without/with an inscription for its state" do
        skip # @todo until method to open_door available
        wide_open_door_no_inscript = unlocked_door_no_inscript.open_door
        wide_open_door_no_inscript.inspect_door.must_equal("Here stands an ancient and sturdy door wide open.")
        wide_open_door_with_inscript = unlocked_door_with_inscript.open_door
        wide_open_door_with_inscript.inspect_door.must_equal("Here stands an ancient and sturdy door wide open. The door has a sign with the inscription: Push to open")
      end

    end #inspect

    describe "#inscribe_door" do
      before(:each) do
        @unlocked_door_no_inscript = Door.new(false, nil)
      end


      it "should set a value to inscription" do
        door = @unlocked_door_no_inscript
        door.inscribe_door("Come through here for danger")
        door.inscription.must_equal("Come through here for danger")
      end

      it "should not be possible to change the inscription once set" do
        door = @unlocked_door_no_inscript
        door.inscribe_door("Come through here for danger")
        proc{door.inscribe_door("Free candy this way")}.must_raise(ArgumentError)
      end

    end #inscription

    describe "open" do
      it "should be possible to open, when closed and unlocked" do
        skip
      end

      it "should be possible to close a door, if open" do
        skip
      end

    end #open

    describe "#turn_key" do

      it "if closed, should be possible to lock or unlocked, by switching state" do
        skip
      end

    end

    describe "#closed?" do

    end

    describe "locked?" do




      it "should give a warning message if the door is used in the wrong way" do
        # missing key?
        # check for warning for opening a locked door without first unlocked
        # check for warning for changing the inscription when there is already once
        # check for warning for closing/opening an already closed/open door
        skip
      end
    end #method
  end #Door
end #mod
