require_relative 'spec_helper'
require '../door'

describe Door do
  let (:d) {Door.new}

  describe "#initialize" do
    it "should create an instance of Door" do
      d.must_be_instance_of(Door)
    end
  end

  describe "#inscription" do
    before(:all) do
      d.inscription("who goes there")
    end

    it "should be able to display an inscription" do
      d.inscription.must_equal("who goes there")
    end

    it "should not be able to change an inscription once it has been set" do
      proc {d.inscription("hello")}.must_raise(ArgumentError)
    end
  end

  describe "#open" do
    it "should open a door if it is unlocked and closed" do
      d.locked = false
      d.open
      d.opened.must_equal(true)
    end

    it "should not open a door if it is unlocked or not closed" do
      d.locked = true
      proc {d.open}.must_raise(ArgumentError)
    end
  end

  describe "#close" do
    it "should close a door if it is open" do
      d.opened = true
      d.close
      d.opened.must_equal(false)
    end

    it "should not close a door if it is already closed" do
      d.opened = false
      proc {d.close}.must_raise(ArgumentError)
    end
  end

  describe "#lock" do
    it "should lock a door if it is unlocked" do
      d.locked = false
      d.lock
      d.locked.must_equal(true)
    end

    it "should not lock if it is already locked" do
      d.locked = true
      proc {d.lock}.must_raise(ArgumentError)
    end
  end

  describe "#unlock" do
    it "should unlock a door if it is locked" do
      d.locked = true
      d.unlock
      d.locked.must_equal(false)
    end

    it "should not unlock a door if it is already unlocked" do
      d.locked = false
      proc {d.unlock}.must_raise(ArgumentError)
    end
  end

  describe "#closed?" do
    it "should be able to check whether or not a door is closed" do
      d.opened = true
      d.closed?.must_equal(false)
    end
  end

  describe "#locked?" do
    it "should be able to check whether or not a door is locked" do
      d.locked = true
      d.locked?.must_equal(true)
    end
  end

end
