require_relative 'spec_helper'
module Dungeon
  describe Door do

    describe "#initialize" do
      before(:each) do
        inscription = "Awesome door!!"
        lock = Lock.new("ABC123") #initializes unlocked
        @door = Door.new(nil, lock)
        @door_with_words = Door.new(inscription, lock)
        @door_no_lock = Door.new(nil)
      end

      it "can create an object of Door" do
        @door.must_be_instance_of(Door)
      end

      it "should respond to parameters of door status" do
        @door.must_respond_to(:inscription)
        @door.must_respond_to(:lock)
      end

      it "should be a closed door that initializes" do
        @door.closed.must_equal(true)
      end

      it "should check parameters are the correct type" do
        @door_with_words.inscription.must_be_instance_of(String)
        @door.lock.must_be_instance_of(Lock)
        @door_no_lock.lock.must_equal(nil)
      end

    end #init

    describe "#inspect_door" do
      before(:each) do
        lock = Lock.new("ABC123") #initializes unlocked
        @door = Door.new(nil, lock)
        locked_inscription = "LOCK THIS DOOR!"
        locking_lock = Lock.new("ABC123")
        locking_lock.locking("ABC123")
        another_locking_lock = Lock.new("ABC123")
        another_locking_lock.locking("ABC123")
        @locked_door_with_inscript = Door.new(locked_inscription, locking_lock)
        @locked_door_no_inscript = Door.new(nil, another_locking_lock)
        @wide_open_door_no_inscript = Door.new(nil).open_door
        inscription = "Awesome door!!"
        @door_with_words = Door.new(inscription, lock)
        @wide_open_door_with_inscript = @door_with_words.open_door
      end

      it "should be possible to inspect a closed door without an inscription for its state of locked/unlocked" do
        @door.inspect_door.must_equal("Here stands an ancient and sturdy door. It is closed but appears to be unlocked.")
        @locked_door_no_inscript.inspect_door.must_equal("Here stands an ancient and sturdy door. It is closed and appears to be locked.")
      end

      it "should be possible to inspect a closed door with an inscription for its state of locked/unlocked" do
        @door.inscribe_door("Awesome door!!")
        @door.inspect_door.must_equal("Here stands an ancient and sturdy door. It is closed but appears to be unlocked. The door has an inscription: Awesome door!!")
        @locked_door_with_inscript.inspect_door.must_equal("Here stands an ancient and sturdy door. It is closed and appears to be locked. The door has an inscription: LOCK THIS DOOR!")
      end

      it "should be possible to inspect an open door without/with an inscription for its state" do
        @wide_open_door_no_inscript.inspect_door.must_equal("Here stands an ancient and sturdy door wide open.")
        @wide_open_door_with_inscript.inspect_door.must_equal("Here stands an ancient and sturdy door wide open. The door has an inscription: Awesome door!!")
      end

    end #inspect

    describe "#inscribe_door" do
      before(:each) do
        @door = Door.new(nil)
      end

      it "should return the door with inscribed words to its inscription" do
        @door.inscribe_door("Awesome door")
        @door.inscription.must_equal("Awesome door")
      end

      it "should set a value to inscription" do
        @door.inscribe_door("Warning! Danger!")
        @door.inscription.must_equal("Warning! Danger!")
      end

      it "should not be possible to change the inscription once set" do
        @door.inscribe_door("Warning! Danger!")
        @door.inscribe_door("Free candy this way")
        @door.inscription.must_equal("Warning! Danger!")
      end

      it "should be inscribed with a String type of at least one character" do
        @door.inscribe_door(:words)
        @door.inscribe_door(1234)
        @door.inscribe_door(3.14)
        @door.inscribe_door("")
        @door.inscription.must_equal(nil)
      end

    end #inscribe_door

    describe "#open_door" do
      before(:each) do
        @door = Door.new(nil)
        lock = Lock.new("GOODKEY")
        @locked_door = Door.new(nil, lock.locking("GOODKEY"))
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
        @door = Door.new(nil)
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
        @door = Door.new(nil)
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
        lock_to_lock = Lock.new("ID-LOCK-THIS")
        @locked_door = Door.new(nil, lock_to_lock)
        @locked_door.locking("ID-LOCK-THIS")
        lock_to_not_lock = Lock.new("ID-LEAVE-UNLOCKED")
        @unlocked_door = Door.new(nil, lock_to_not_lock)
        @lockfree_door = Door.new(nil)
      end

      it "should return true if the door is locked" do
        @locked_door.locked?.must_equal(true)
      end

      it "should return false if the door is unlocked or if there is no lock on the door" do
        @unlocked_door.locked?.must_equal(false)
        @lockfree_door.locked?.must_equal(false)
      end
    end #locked?

    describe "#locking" do
      before(:each) do
        lock = Lock.new("GOODKEY")
        @door_without_lock = Door.new(nil)
        @door = Door.new(nil, lock)
      end

      it "should be possible to lock the door" do
        @door.locking("GOODKEY")
        @door.locked?.must_equal(true)
      end

      it "can only lock if it has a key assigned/if it has a lock" do
        proc{@door_without_lock.locking}.must_raise(ArgumentError)
      end

      it "must fail to lock unless key identifier match input key" do
        proc{@door.locking("BADKEY")}.must_raise(ArgumentError)
      end

      it "should only be possible to lock a closed door" do
        @door.open_door
        proc{@door.locking("GOODKEY")}.must_raise(ArgumentError)
      end
    end #locking

    describe "#unlocking" do
      before(:each) do
        lock = Lock.new("GOODKEY")
        @door_without_lock = Door.new(nil)
        @door = Door.new(nil, lock)
      end

      it "should be possible to unlock the door" do
        @door.locking("GOODKEY")
        @door.unlocking("GOODKEY")
        @door.locked?.must_equal(false)
      end

      it "can only unlock if it has a key assigned/if it has a lock" do
        proc{@door_without_lock.unlocking}.must_raise(ArgumentError)
      end

      it "must fail to unlock unless key identifier match input key" do
        proc{@door.locking("BADKEY")}.must_raise(ArgumentError)
      end
    end #locking
  end #Door
end #mod
