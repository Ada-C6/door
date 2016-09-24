require_relative 'spec_helper'
module Dungeon
  describe Door do

    describe "#initialize" do
      before(:each) do
        sign = Sign.new
        sign_with_words = Sign.new("Awesome door")
        lock = Lock.new("ABC123") #initializes unlocked
        @door = Door.new(sign, lock)
        @door_with_words = Door.new(sign_with_words, lock)
        @door_no_lock = Door.new(sign)
      end

      it "can create an object of Door" do
        @door.must_be_instance_of(Door)
      end

      it "should respond to parameters of door status" do
        @door.must_respond_to(:sign)
        @door.must_respond_to(:lock)
      end

      it "should be a closed door that initializes" do
        @door.closed.must_equal(true)
      end

      it "should check parameters are the correct type" do
        @door.sign.must_be_instance_of(Sign)
        @door.lock.must_be_instance_of(Lock)
        @door_no_lock.lock.must_equal(nil)
      end

    end #init

    describe "#inspect_door" do
      before(:each) do
        sign = Sign.new
        lock = Lock.new("ABC123") #initializes unlocked
        @door = Door.new(sign, lock)
        sign_with_words = Sign.new("Awesome door")

        locked_sign = Sign.new("LOCK THIS DOOR!")
        locking_lock = Lock.new("ABC123")
        locked_lock = locking_lock.turn_key("ABC123")
        @locked_door = Door.new(locked_sign, locked_lock)
        # @door_with_words = Door.new(sign_with_words, lock)
        # @wide_open_door_no_inscript = door.open_door
        # @wide_open_door_with_inscript = door_with_words.open_door
      end

      it "should be possible to inspect a closed door without an inscription for its state of locked/unlocked" do
        skip
        @door.inspect_door.must_equal("Here stands an ancient and sturdy door. It is closed but appears to be unlocked.")
        @locked_door.inspect_door.must_equal("Here stands an ancient and sturdy door. It is closed and appears to be locked.")
      end

      it "should be possible to inspect a closed door with an inscription for its state of locked/unlocked" do
        skip
        @door.inspect_door.must_equal("Here stands an ancient and sturdy door. It is closed but appears to be unlocked. The door has a sign with the inscription: Push to open")
        @locked_door.inspect_door.must_equal("Here stands an ancient and sturdy door. It is closed and appears to be locked. The door has a sign with the inscription: Awesome door")
      end

      it "should be possible to inspect an open door without/with an inscription for its state" do
        skip
        @wide_open_door_no_inscript.inspect_door.must_equal("Here stands an ancient and sturdy door wide open.")
        @wide_open_door_with_inscript.inspect_door.must_equal("Here stands an ancient and sturdy door wide open. The door has a sign with the inscription: Awesome door")
      end

    end #inspect

    describe "#inscribe_door" do
      before(:each) do
        sign = Sign.new
        @door = Door.new(sign)
      end

      it "should return the door with inscribed words to its sign" do
        @door.inscribe_door("Awesome door")
        @door.sign.inscription.must_equal("Awesome door")
      end

    end #inscription

    describe "#open_door" do
      before(:each) do
        sign = Sign.new
        @door = Door.new(sign)
        lock = Lock.new("GOODKEY")
        door = Door.new(sign, lock)
        @locked_door = door.turn_key("GOODKEY") #returns a locked door
      end

      it "should be possible to open the door" do
        @door.open_door
        @door.closed.must_equal(false)
      end

      it "should not be possible to open a locked door" do
        proc{@locked_door.open_door}.must_raise(ArgumentError)
      end

      it "should not be possible to open an already open door" do
        @door.open_door
        proc{@door.open_door}.must_raise(ArgumentError)
      end
    end #open

    describe "#close_door" do
      before(:each) do
        sign = Sign.new
        @door = Door.new(sign)
      end

      it "should be possible to close an open door" do
        @door.open_door
        @door.close_door
        @door.closed.must_equal(true)
      end

      it "should not be possible to close a door when it is already closed" do
        proc{@door.close_door}.must_raise(ArgumentError)
      end
    end #closed

    describe "#closed?" do
      before(:each) do
        sign = Sign.new
        @door = Door.new(sign)
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
        sign = Sign.new
        lock_to_lock = Lock.new("LOCK THIS")
        lock_door = Door.new(sign, lock_to_lock)
        @locked_door = lock_door.turn_key("LOCK THIS") #returns a locked door
        lock_to_not_lock = Lock.new("LEAVE-UNLOCKED")
        @unlocked_door = Door.new(sign, lock_to_not_lock)
      end

      it "should return true if the door is locked" do
        @locked_door.locked?.must_equal(true)
      end

      it "should return false if the door is unlocked or if there is no lock on the door" do
        @unlocked_door.locked?.must_equal(false)
      end
    end #locked?

    describe "#turn_key" do
      before(:each) do
        sign = Sign.new
        lock = Lock.new("GOODKEY")
        @door_without_lock = Door.new(sign)
        @door = Door.new(sign, lock)
      end

      it "should be possible to turn the key in the lock to switch lock state" do
        @door.turn_key("GOODKEY")
        @door.locked?.must_equal(true)
        @door.turn_key("GOODKEY")
        @door.locked?.must_equal(false)
      end

      it "can only have a key turning if it has a key assigned/if it has a lock" do
        proc{@door_without_lock.turn_key}.must_raise(ArgumentError)
      end

      it "must fail to lock/unlock unless key identifier match input key" do
        proc{@door.turn_key("BADKEY")}.must_raise(ArgumentError)
      end

      it "should only be possible to lock a closed door" do
        @door.open_door
        proc{@door.turn_key("GOODKEY")}.must_raise(ArgumentError)
      end
    end #method
  end #Door
end #mod
