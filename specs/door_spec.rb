require_relative 'spec_helper'
module Dungeon
  describe Door do

    describe "#initialize" do
      before(:each) do
        inscription = "Awesome door!!"
        @door = Door.new(nil, LockFactory.new("ABC123"))
        @door_with_words = Door.new(inscription, LockFactory.new("ABC123"))
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
        @door_no_inscript = Door.new(nil, LockFactory.new("ABC123"))
        inscription = "Awesome door!!"
        @door_with_words_and_lock = Door.new(inscription, LockFactory.new("ABC123"))
        @door_no_lock = Door.new(inscription)
      end

      it "should be possible to inspect a closed door without an inscription for its state of locked/unlocked" do
        @door_no_inscript.inspect_door.must_equal("Here stands an ancient and sturdy door. It is closed but appears to be unlocked.")
        @door_no_inscript.locking("ABC123")
        @door_no_inscript.inspect_door.must_equal("Here stands an ancient and sturdy door. It is closed and appears to be locked.")
      end

      it "should be possible to inspect a closed door with an inscription for its state of locked/unlocked" do
        @door_with_words_and_lock.inspect_door.must_equal("Here stands an ancient and sturdy door. It is closed but appears to be unlocked. The door has an inscription: Awesome door!!")
        @door_with_words_and_lock.locking("ABC123")
        @door_with_words_and_lock.inspect_door.must_equal("Here stands an ancient and sturdy door. It is closed and appears to be locked. The door has an inscription: Awesome door!!")
      end

      it "should be possible to inspect an open door without/with an inscription for its state" do
        @door_no_inscript.open_door
        @door_no_inscript.inspect_door.must_equal("Here stands an ancient and sturdy door wide open.")
        @door_with_words_and_lock.open_door
        @door_with_words_and_lock.inspect_door.must_equal("Here stands an ancient and sturdy door wide open. The door has an inscription: Awesome door!!")
        @door_no_lock.open_door
        @door_no_lock.inspect_door.must_equal("Here stands an ancient and sturdy door wide open. The door has an inscription: Awesome door!!")
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
        @door = Door.new(nil, LockFactory.new("ABC123"))
        @door_to_lock = Door.new(nil, LockFactory.new("ABC123"))
      end

      it "should be possible to open the door" do
        @door.open_door
        @door.closed.must_equal(false)
      end

      it "should not be possible to open a locked door" do
        @door_to_lock.locking("ABC123")
        proc{@door_to_lock.open_door}.must_raise(ArgumentError)
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
        @door = Door.new(nil, LockFactory.new("ABC123"))
        @door_to_lock = Door.new(nil, LockFactory.new("ABC123"))
        @lockfree_door = Door.new(nil)
      end

      it "should return true if the door is locked" do
        @door_to_lock.locking("ABC123")
        @door_to_lock.locked?.must_equal(true)
      end

      it "should return false if the door is unlocked or if there is no lock on the door" do
        @door.locked?.must_equal(false)
        @lockfree_door.locked?.must_equal(false)
      end
    end #locked?

    describe "#locking" do
      before(:each) do
        @door = Door.new(nil, LockFactory.new("GOODKEY"))
        @door_without_lock = Door.new(nil)
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
        @door_with_lock = Door.new(nil, LockFactory.new("GOODKEY"))
        @door_without_lock = Door.new(nil)
      end

      it "should be possible to unlock the door" do
        @door_with_lock.locking("GOODKEY")
        @door_with_lock.unlocking("GOODKEY")
        @door_with_lock.locked?.must_equal(false)
      end

      it "can only unlock if it has a key assigned/if it has a lock" do
        proc{@door_without_lock.unlocking}.must_raise(ArgumentError)
      end

      it "must fail to unlock unless key identifier match input key" do
        proc{@door_with_lock.locking("BADKEY")}.must_raise(ArgumentError)
      end
    end #locking
  end #Door
end #mod
