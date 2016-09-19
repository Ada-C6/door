require_relative 'spec_helper'

describe Door do

  describe "#initialize" do
    it "should create an instance of Door" do
      Door.new("bathroom").must_be_instance_of Door
    end

    it "should create an unlocked door" do
      Door.new("bathroom").locked?.must_equal false
    end

    it "should create an open door" do
      Door.new("bathroom").opened.must_equal true
    end
  end

  # describe "#input" do
  #   it "should raise an Argument Error if the user is trying to perform an action it can't handle" do
  #     proc { door.input("fart") }.must_raise(ArgumentError)
  #   end
  #
  #   it "should return a valid action" do
  #     door = Door.new("bathroom")
  #     door.input("OPEN").must_equal "open"
  #   end
  # end

  describe "#open" do
    it "should raise an ArgumentError if the door is already opened" do
      door = Door.new("bathroom")
      proc { door.open }.must_raise(ArgumentError)
    end
  end
end
