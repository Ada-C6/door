require_relative 'spec_helper'
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

    describe "#inspect_door" do
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
        wide_open_door_no_inscript = unlocked_door_no_inscript
        wide_open_door_no_inscript.open_door
        wide_open_door_no_inscript.inspect_door.must_equal("Here stands an ancient and sturdy door wide open.")
        wide_open_door_with_inscript = unlocked_door_with_inscript
        wide_open_door_with_inscript.open_door
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

    describe "#open_door" do
      before(:each) do
        @unlocked_door = Door.new(false, nil)
      end
      let(:locked_door) { Door.new(true, "123ABC") }


      it "should be possible to open the door" do
        @unlocked_door.open_door
        @unlocked_door.closed.must_equal(false)
      end

      it "should not be possible to open a locked door" do
        proc{locked_door.open_door}.must_raise(ArgumentError)
      end

      it "should not be possible to open an already open door" do
        door = @unlocked_door
        door.open_door
        proc{door.open_door}.must_raise(ArgumentError)
      end
    end #open

    describe "#close_door" do
      let(:door) { Door.new(false, nil) }

      it "should be possible to close an open door" do
        door.open_door
        door.close_door
        door.closed.must_equal(true)
      end

      it "should not be possible to close a door when it is already closed" do
        proc{door.close_door}.must_raise(ArgumentError)
      end
    end #closed

    describe "#closed?" do
      before(:each) do
        @door = Door.new(false, nil)
      end

      it "should return true if the door is closed" do
        @door.closed?.must_equal(true)
      end

      it "should return false if the door is open" do
        @door.open_door
        @door.closed?.must_equal(false)
      end
    end #closed?

    describe "#locked?" do
      before(:each) do
        @locked_door = Door.new(true, "ABC123")
        @unlocked_door = Door.new(false, nil)
      end

      it "should return true if the door is locked" do
        @locked_door.locked?.must_equal(true)
      end

      it "should return false if the door is unlocked" do
        @unlocked_door.locked?.must_equal(false)
      end
    end #locked?

    describe "#turn_key" do
      before(:each) do
        @locked_door = Door.new(true, "ABC123")
        @unlocked_door = Door.new(false, "ABC123")
        @door_without_lock = Door.new(false,nil)
      end

      it "should be possible to turn the key in the lock to switch lock state" do
        @locked_door.turn_key("ABC123")
        @locked_door.locked?.must_equal(false)

        @unlocked_door.turn_key("ABC123")
        @unlocked_door.locked?.must_equal(true)
      end

      it "can only have a key turning if it has a key assigned/if it has a lock" do
        proc{@door_without_lock.turn_key}.must_raise(ArgumentError)
        proc{@door_without_lock.turn_key}.must_raise(ArgumentError)
      end

      it "must fail to lock/unlock unless key identifier match input key" do
        proc{@locked_door.turn_key("BADKEY")}.must_raise(ArgumentError)
      end

      it "should only be possible to unlock/lock a closed door" do
        door = @unlocked_door
        door.open_door
        proc{door.turn_key("ABC123")}.must_raise(ArgumentError)
      end
    end #method
  end #Door
end #mod
