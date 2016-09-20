require_relative 'spec_helper'

describe Door do
  my_door = Door.new(true, true)
  describe "#initialize" do
    it "must create a Door object" do
      my_door.must_be_instance_of(Door)
    end

    it "must respond to open and unlocked" do
      my_door.must_respond_to(:open)
      my_door.must_respond_to(:unlocked)
      my_door.open.must_equal(true)
      # my_door.close_door.must_equal(true)
      # my_door.open.must_equal(false)

    end
  end

  describe "#open_door" do
    door_one = Door.new(false, true)
    door_two = Door.new(true, true)

    it "can be opened if closed" do
      door_one.open_door.must_equal(true)
    end

    it "cannot be opened if already open" do
      proc {door_two.open_door}.must_raise(ArgumentError)
    end

  end

  describe "#close_door" do
    door_one = Door.new(false, true)
    door_two = Door.new(true, true)
    it "can be closed if open" do
      door_two.close_door.must_equal(false)
      door_two.open.must_equal(false)
    end

    it "cannot be closed if already closed" do
      door_one.open.must_equal(false)
      proc {door_one.close_door}.must_raise ArgumentError
    end
  end

  describe "#unlock_door" do
    door_one = Door.new(false, true)
    door_two = Door.new(false, false)

    it "can be unlocked if locked" do
      door_two.unlocked.must_equal(false)
      door_two.unlock_door.must_equal(true)
      door_two.unlocked.must_equal(true)
    end

    it "cannot be unlocked if already unlocked" do
      door_one.unlocked.must_equal(true)
      proc {door_one.unlock_door}.must_raise(ArgumentError)
    end
  end

  describe "#lock_door" do
    door_one = Door.new(false, true)
    door_two = Door.new(false, false)

    it "can be locked if unlocked" do
      door_one.lock_door.must_equal(false)
      door_one.unlocked.must_equal(false)
    end

    it "cannot be locked if already locked" do
      proc {door_two.lock_door}.must_raise(ArgumentError)
    end
  end

  describe "#inscribe" do
    my_door = Door.new(true, true)
      it "can be inscribed once, and only once" do
        my_door.inscribe("Speak, friend, and enter").must_equal("Speak, friend, and enter")
        my_door.inscription.must_be_instance_of(String)
        proc {my_door.inscribe("I don't understand this riddle")}.must_raise(ArgumentError)
      end
  end
 end
