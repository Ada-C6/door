require 'spec_helper.rb'
require 'door.rb'


describe "Testing door" do
  it "Creates a new instance of door" do

    locked = true
    closed = true
    INSCRIPTION = "Pull"

    quotidian_door = Door.new(locked, closed, INSCRIPTION)

    quotidian_door.must_be_kind_of Door
    quotidian_door.locked.must_equal locked
    quotidian_door.closed.must_equal closed
    quotidian_door.INSCRIPTION.must_equal INSCRIPTION

  end

  it "Tests that a closed and unlocked door can be opened" do
    quotidian_door = Door.new(false, true, "Pull")
    quotidian_door.closed.must_equal true
    quotidian_door.open_door.must_be_kind_of String
    quotidian_door.closed.must_equal false
  end

  it "Tests that a closed and locked door cannot be opened" do
    quotidian_door = Door.new(true, true, "Pull")
    quotidian_door.closed.must_equal true
    quotidian_door.locked.must_equal true
    quotidian_door.open_door.must_equal "A door must be closed and unlocked before it can open!"
    quotidian_door.closed.must_equal true
    quotidian_door.locked.must_equal true
  end

  it "Tests that a closed door can be locked" do
    quotidian_door = Door.new(false, true, "Pull")
    quotidian_door.locked.must_equal false
    quotidian_door.lock_door.must_equal "The door is now locked"
    quotidian_door.locked.must_equal true
  end

  it "Tests that an open door cannot be locked" do
    quotidian_door = Door.new(false, false, "Pull")
    quotidian_door.locked.must_equal false
    quotidian_door.lock_door.must_equal "You must close the door before you can lock it!"
    quotidian_door.locked.must_equal false
  end

  it "Tests that a closed door cannot be closed" do
    quotidian_door = Door.new(false, true, "Pull")
    quotidian_door.closed.must_equal true
    quotidian_door.close_door.must_equal "Door is already closed!"
    quotidian_door.closed.must_equal true
  end

  it "Tests that an open door can be closed" do
    quotidian_door = Door.new(false, false, "Pull")
    quotidian_door.closed.must_equal false
    quotidian_door.close_door.must_equal "Door is now closed!"
    quotidian_door.closed.must_equal true
  end











end