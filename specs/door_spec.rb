require_relative 'spec_helper'

describe Door do

  describe "#initialize" do
    it "should create an instance of Door" do
      Door.new("bathroom").must_be_instance_of Door
    end

    it "should create an unlocked door" do
      Door.new("bathroom").locked.must_equal false
    end

    it "should create an open door" do
      Door.new("bathroom").opened.must_equal true
    end

    it "should only accept a string" do
      proc { Door.new(2) }.must_raise(ArgumentError)
    end
  end

  describe "#open" do
    it "should raise an ArgumentError if the door is already opened" do
      door = Door.new("bathroom")
      proc { door.open }.must_raise(ArgumentError)
    end

    it "should raise an ArgumentError if the door is locked" do
      door = Door.new("bathroom")
      proc { door.lock.open }.must_raise(ArgumentError)
    end
  end

  describe "#close" do
    it "should raise an ArgumentError if the door is already closed" do
      door = Door.new("bathroom")
      door.close
      proc { door.close }.must_raise(ArgumentError)
    end
  end

  describe "#lock" do
    it "should raise an ArgumentError if the door is open" do
      door = Door.new("bathroom")
      proc { door.lock }.must_raise(ArgumentError)
    end

    it "should raise an ArgumentError if the door is already locked" do
      door = Door.new("bathroom")
      proc { door.lock.lock }.must_raise(ArgumentError)
    end
  end

  describe "#unlock" do
    it "should raise an ArgumentError if the door is already unlocked" do
      door = Door.new("bathroom")
      proc { door.unlock }.must_raise(ArgumentError)
    end
  end

  describe "#inspect" do
    it "should return a string" do
      door = Door.new("bathroom")
      door.inspect.must_be_kind_of String
    end
  end

end
