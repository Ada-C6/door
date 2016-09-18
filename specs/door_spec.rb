require_relative 'spec_helper'
# require_relative '../door.rb'

describe Door do
  let(:door) { Door.new }

  describe "#initialize" do

    it "can create a new instance of Door" do
      door.must_be_instance_of(Door)
    end

    it "should allow user to check if door is closed" do
      door.must_respond_to(:closed)
    end

    it "should allow user to check if door is locked" do
      door.locked.class.must_equal(FalseClass)
    end

    it "should initialize without an inscription string" do
      door.inscription.must_be(:==, nil)
    end

  end

  describe "#inscribe" do
    inscribed_door = Door.new
    inscribed_door.inscribe("welcome")

    it "should allow user to set the inscription" do
      inscribed_door.inscription.must_equal("welcome")
    end

    it "should raise an error if user tries to set an inscription when one already exists" do
      proc { inscribed_door.inscribe("goodbye") }.must_raise(StandardError)
    end

# does this do what I think it does??? how does proc work? proc saves the result of the block?
    it "should not allow the user to set an inscription if one already exists" do
      proc { inscribed_door.inscribe("goodbye") }
      inscribed_door.inscription.must_equal("welcome")
    end

  end

  describe "#lock" do
    before(:each) do
      @door = Door.new
    end

    it "should change the door's locked attribute to true" do
      @door.lock
      @door.locked.must_equal(true)
    end

    it "should raise an error if the door is already locked" do
      @door.lock
      proc { @door.lock }.must_raise(StandardError)
    end
  end

  describe "#unlock" do
    before(:each) do
      @door = Door.new
    end

    it "should unlock the door" do
      @door.lock
      @door.unlock
      @door.locked.must_equal(false)
    end

    it "should raise an error if the door is already unlocked" do
      proc { @door.unlock }.must_raise(StandardError)
    end
  end

  describe "#open" do
    before(:each) do
      @door = Door.new
    end

    it "should change the door's closed attribute to open" do
      @door.open
      @door.closed.must_equal(false)
    end

    it "should raise an error if the door is already opened" do
      @door.open
      proc { @door.open }.must_raise(StandardError)
    end

    it "should raise an error if the door is locked" do
      @door.lock
      proc { @door.open }.must_raise(StandardError)
    end

    it "should not change the closed attribute if the door is already open or locked" do
      @door.lock
      proc { @door.open }
      @door.closed.must_equal(true)
    end
  end

  describe "#close" do
    before(:each) do
      @door = Door.new
    end

    it "should raise an error if the door is already closed" do
      proc { @door.close }.must_raise(StandardError)
    end

    it "should change the closed attribute to true" do
      @door.open
      @door.close
      @door.closed.must_equal(true)
    end

  end
end
